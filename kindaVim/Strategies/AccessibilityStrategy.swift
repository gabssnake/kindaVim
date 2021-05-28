import Foundation

protocol AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    static func dump(element: AccessibilityTextElement?)
}

enum BlockCursorStatus {
    case on
    case off
}

struct AccessibilityStrategy: AccessibilityStrategyProtocol {

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.isNotEmpty(), element.caretIsAtTheEnd(), element.lastCharacterIsNotLinefeed() {
            element.axCaretLocation -= 1

            return element
        }

        if element.isNotEmpty(), element.caretIsNotAtTheEnd(), element.axCaretLocation > element.currentLine.startLimit() {
            element.axCaretLocation -= 1
        }

        return element
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.axRole == .textArea else { return nil }
        
        if let lineNumber = element.currentLine.number, let lineRangeForNextLine = AXEngine.axLineRangeFor(lineNumber: lineNumber + 1) {
            if lineRangeForNextLine.length >= element.columnNumber! {
                element.axCaretLocation = lineRangeForNextLine.location + element.columnNumber!
            } else {
                if let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineNumber + 1) {
                    element.axCaretLocation = nextLine.endLimit()
                }
            }
        }
        
        return element
    }

    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.caretIsNotAtTheEnd(), element.axCaretLocation < element.currentLine.endLimit() {
            element.axCaretLocation += 1
        }

        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.caretIsNotAtTheEnd() {
            element.axCaretLocation = element.currentLine.endLimit()
        }

        return element
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.caretIsNotAtTheEnd() {
            element.axCaretLocation = element.currentLine.startLimit()
        }

        return element
    }

    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        switch status {
        case .on:
            element = h(on: element)!
            element.axSelectedLength = 0
        case .off:
            element.axSelectedLength = 0
        }

        return element
    }
    
    static func dump(element: AccessibilityTextElement?) {
        print("\ncaret position: \(String(describing: element?.axCaretLocation))")
        print("line start: \(String(describing: element?.currentLine.start))", "line end: \(String(describing: element?.currentLine.end))")
    }

    static func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityTextElementAdaptor.toAXFocusedElememt(from: element)
    }
    
}
