// REMINDER:
// internalText if for internal use only
// which means, mainly to search for where to position the caret
// the internalText is not sent back to the focused AXUIElement
// because that would rewrite the whole thing, which is slow and flickers badly in some cases
// like, for example, in Xcode :D
// so the way we handle this is by using the SelectedText and SelectedTextRange to remove or add
// what we need in the current buffer, rather than pushing the full text.

enum AccessibilityTextElementRole {
    
    case textField
    case textArea
    case someOtherShit
    
}


struct AccessibilityTextElementLine {
    
    var fullValue: String
    var value: String {        
        let lineStartIndex = fullValue.index(fullValue.startIndex, offsetBy: start)
        let lineEndIndex = fullValue.index(lineStartIndex, offsetBy: end - start)
        
        return String(fullValue[lineStartIndex..<lineEndIndex])
    }
    
    let number: Int
    let start: Int
    let end: Int
    var length: Int { end - start }
    var lengthWithoutLinefeed: Int { value.hasSuffix("\n") ? length - 1 : length }
    var endLimit: Int {
        guard end - start > 1 else { return start }

        return value.hasSuffix("\n") ? end - 2 : end - 1
    }
    
    var isNotAnEmptyLine: Bool { !isAnEmptyLine }
    var isTheFirstLine: Bool { start == 0 }    
    var isTheLastLine: Bool { !value.hasSuffix("\n") }
    var isAnEmptyLine: Bool { value == "\n" || value == "" }
    
}


extension AccessibilityTextElementLine: Equatable {
    public static func == (lhs: AccessibilityTextElementLine, rhs: AccessibilityTextElementLine) -> Bool {
        lhs.fullValue == rhs.fullValue
            && lhs.number == rhs.number
            && lhs.start == rhs.start
            && lhs.end == rhs.end
    }
}


struct AccessibilityTextElement {

    static var globalColumnNumber = 1

    private(set) var role: AccessibilityTextElementRole = .someOtherShit
    private(set) var value = ""
    private(set) var length = 0
    
    var caretLocation = 0 {
        didSet {
            if let lineForLocation = AccessibilityTextElementAdaptor.lineFor(location: caretLocation), lineForLocation.isNotAnEmptyLine {
                Self.globalColumnNumber = caretLocation - lineForLocation.start + 1
            }
        }
    }
    var selectedLength = 0 {
        didSet {
            if VimEngine.shared.currentMode == .visual, AccessibilityStrategyVisualMode.anchor != nil {
                if caretLocation < AccessibilityStrategyVisualMode.anchor {
                    AccessibilityStrategyVisualMode.head = caretLocation
                } else {
                    AccessibilityStrategyVisualMode.head = caretLocation + selectedLength - 1
                }
            }
        }
    }
    var selectedText: String?
    
    var currentLine: AccessibilityTextElementLine!
    
    var isEmpty: Bool { value.isEmpty }    
    var isNotEmpty: Bool { !isEmpty }
    var caretIsAtTheEnd: Bool { caretLocation == length }    
    var lastCharacterIsLinefeed: Bool { value.last == "\n" }
    var lastCharacterIsNotLinefeed: Bool { !lastCharacterIsLinefeed }

}


extension AccessibilityTextElement: Equatable {
    
    public static func == (lhs: AccessibilityTextElement, rhs: AccessibilityTextElement) -> Bool {
        lhs.role == rhs.role
            && lhs.value == rhs.value
            && lhs.caretLocation == rhs.caretLocation
            && lhs.selectedLength == rhs.selectedLength
            && lhs.selectedText == rhs.selectedText
            && lhs.currentLine == rhs.currentLine
    }
    
}
