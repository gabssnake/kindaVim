
import Foundation


protocol AccessibilityStrategyProtocol {

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func f(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func F(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func O(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func t(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func T(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement?
}


struct AccessibilityStrategy: AccessibilityStrategyProtocol {
    
    var textEngine: TextEngineProtocol = TextEngine()
    

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.value.count != 0 else { return element }
        guard element.currentLine.isOnlyALinefeedCharacter() != true else { return element }

        element.caretLocation += 1

        return element
    }
    
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard !element.currentLine.isOnlyALinefeedCharacter() else { return element }
        
        if let endLimit = element.currentLine.endLimit() {
            element.caretLocation = endLimit + 1
        }
        
        return element
    }
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = textEngine.wordBackward(startingAt: element.caretLocation, in: element.value)  
        
        return element
    }
    
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        let lineText = element.currentLine.value
        
        if let previousDoubleQuoteLocation = textEngine.findPrevious("\"", before: element.caretLocation, in: lineText) {
            if let nextDoubleQuoteLocation = textEngine.findNext("\"", after: element.caretLocation - 1, in: lineText) {
                element.caretLocation = element.currentLine.start! + (previousDoubleQuoteLocation + 1)
                element.selectedLength = nextDoubleQuoteLocation - (previousDoubleQuoteLocation + 1)
                element.selectedText = ""
                
                return element
            }
            
            return nil
        }
                
        if let firstDoubleQuoteLocation = textEngine.findFirst("\"", in: lineText), let secondDoubleQuoteLocation = textEngine.findSecond("\"", in: lineText) {
            element.caretLocation = element.currentLine.start! + (firstDoubleQuoteLocation + 1)
            element.selectedLength = secondDoubleQuoteLocation - (firstDoubleQuoteLocation + 1)
            element.selectedText = ""
            
            return element
        }
        
        return nil        
    }
    
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard let lineEnd = element.currentLine.end else { return element }
        
        let startOfNextLineToEndOfText = element.value[element.value.index(element.value.startIndex, offsetBy: lineEnd)..<element.value.endIndex]
        let firstNonBlankOnNextLineLocation = textEngine.findFirstNonBlank(in: String(startOfNextLineToEndOfText))

        element.caretLocation = element.currentLine.start! + firstNonBlankOnNextLineLocation
        element.selectedLength = lineEnd - element.currentLine.start!
        element.selectedText = ""
        
        return element
    }

    func f(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard let lineStart = element.currentLine.start else { return element }
        
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let characterFoundLocation = textEngine.findNext(character, after: lineCaretLocation, in: lineText) {
            element.caretLocation = element.currentLine.start! + characterFoundLocation            
        }

        return element
    }
    
    func F(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard let lineStart = element.currentLine.start else { return element }
        
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let characterFoundLocation = textEngine.findPrevious(character, before: lineCaretLocation, in: lineText) {
            element.caretLocation = element.currentLine.start! + characterFoundLocation            
        }
        
        return element
    }

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isNotEmpty(), element.caretIsAtTheEnd(), element.lastCharacterIsNotLinefeed() {
            element.caretLocation -= 1

            return element
        }

        if element.isNotEmpty(), let startLimit = element.currentLine.startLimit(), element.caretLocation > startLimit {
            element.caretLocation -= 1
        }

        return element
    }
    
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return element
    }
    
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        let lineText = element.currentLine.value
        
        let characterFoundLocation = textEngine.findFirstNonBlank(in: lineText)
        
        if let lineStart = element.currentLine.start {
            element.caretLocation = lineStart + characterFoundLocation
        } 
        
        return element
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return nil }

        if let currentLineNumber = element.currentLine.number, let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: currentLineNumber + 1) {
            if nextLine.isLastLine(), nextLine.isOnlyALinefeedCharacter() {
                let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                element.caretLocation = element.value.count
                AccessibilityTextElement.globalColumnNumber = globalColumNumber
            } else {
                if let nextLineLength = nextLine.length, nextLineLength > AccessibilityTextElement.globalColumnNumber {
                    element.caretLocation = nextLine.start! + AccessibilityTextElement.globalColumnNumber - 1
                } else {
                    if let endLimit = nextLine.endLimit() {
                        let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                        element.caretLocation = endLimit
                        AccessibilityTextElement.globalColumnNumber = globalColumNumber
                    }
                }
            }
        }
                
        return element
    }
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return nil }

        var previousLine: AccessibilityTextElementLine?

        if element.currentLine.isLastLine() {
            previousLine = AccessibilityTextElementAdaptor.lineFor(location: element.caretLocation - 1)
        } else {
            previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number! - 1)
        }

        if let previousLine = previousLine {
            if let previousLineLength = previousLine.length, previousLineLength > AccessibilityTextElement.globalColumnNumber {
                element.caretLocation = previousLine.start! + AccessibilityTextElement.globalColumnNumber - 1
            } else {
                if let endLimit = previousLine.endLimit() {
                    let globalColumnNumber = AccessibilityTextElement.globalColumnNumber
                    element.caretLocation = endLimit
                    AccessibilityTextElement.globalColumnNumber = globalColumnNumber
                }
            }
        }

        return element
    }

    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let endLimit = element.currentLine.endLimit(), element.caretLocation < endLimit {
            element.caretLocation += 1
        }

        return element
    }
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return element }
        
        if element.currentLine.isLastLine() || element.currentLine.isOnlyALinefeedCharacter() {
            element.selectedLength = 0
            element.selectedText = "\n" 
        } else {
            let lineText = element.currentLine.value         
            let lineCaretLocationIndex = lineText.index(lineText.startIndex, offsetBy: element.caretLocation - element.currentLine.start!)            
            let limitForCopyingTextIndex = lineText.index(lineText.startIndex, offsetBy: element.currentLine.endLimit()! - element.currentLine.start! + 1)        
            
            let textFromCaretToLimitForCopyingText = lineText[lineCaretLocationIndex..<limitForCopyingTextIndex]
            
            let firstNonBlankOfCurrentLineLocation = textEngine.findFirstNonBlank(in: lineText)
            let firstNonBlankOfCurrentLineText = lineText[lineText.startIndex..<lineText.index(lineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]      
            
            element.selectedLength = textFromCaretToLimitForCopyingText.count
            element.selectedText = String(textFromCaretToLimitForCopyingText + "\n" + firstNonBlankOfCurrentLineText)                            
        }
        
        return element
    }
    
    func O(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return element }
        
        if element.currentLine.isFirstLine() {
            let lineText = element.currentLine.value
            let firstNonBlankOfCurrentLineLocation = textEngine.findFirstNonBlank(in: lineText)
            let firstNonBlankOfCurrentLineText = lineText[lineText.startIndex..<lineText.index(lineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]
            
            element.caretLocation = 0
            element.selectedLength = 0
            element.selectedText = "\n"            
            
            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
            
            element.caretLocation = 0
            element.selectedLength = 0
            element.selectedText = String(firstNonBlankOfCurrentLineText)
            
            return element            
        }
        
        if element.currentLine.isLastLine() {
            element.selectedText = "\n"
            
            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
            
            element.selectedText = ""
            
            return element
        }
                
        let previousLine = textEngine.previousLine(before: element.caretLocation, in: element.value)!
        let lineText = element.currentLine.value
        let lineStart = element.currentLine.start!
        let firstNonBlankOfCurrentLineLocation = textEngine.findFirstNonBlank(in: lineText)
        let firstNonBlankOfCurrentLineText = lineText[lineText.startIndex..<lineText.index(lineText.startIndex, offsetBy: firstNonBlankOfCurrentLineLocation)]
            
        element.caretLocation = lineStart - previousLine.count
        element.selectedLength = previousLine.count - 1
        element.selectedText = previousLine + firstNonBlankOfCurrentLineText
            
        return element         
    }
    
    func t(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard let lineStart = element.currentLine.start else { return element }
        
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let characterFoundLocation = textEngine.findNext(character, after: lineCaretLocation, in: lineText) {
            element.caretLocation = element.currentLine.start! + characterFoundLocation - 1            
        }
        
        return element
    }
    
    func T(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard let lineStart = element.currentLine.start else { return element }        
        
        let lineText = element.currentLine.value
        let lineCaretLocation = element.caretLocation - lineStart
        
        if let characterFoundLocation = textEngine.findPrevious(character, before: lineCaretLocation, in: lineText) {
            element.caretLocation = element.currentLine.start! + characterFoundLocation + 1
        }
        
        return element
    }

    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        element.caretLocation = textEngine.wordForward(startingAt: element.caretLocation, in: element.value)

        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let endLimit = element.currentLine.endLimit() {
            element.caretLocation = endLimit
        } else {
            if element.lastCharacterIsNotLinefeed() {
                element.caretLocation -= 1
            }
        }

        return element
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let startLimit = element.currentLine.startLimit() {
            element.caretLocation = startLimit
        }

        return element
    }
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        print("\ncaret position: \(String(describing: element?.caretLocation))")
        print("line start: \(String(describing: element?.currentLine.start))", "line end: \(String(describing: element?.currentLine.end))")
        
        return nil
    }

    static func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
    }

}
