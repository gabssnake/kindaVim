import Foundation

protocol AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement?

}

enum BlockCursorStatus {
    case on
    case off
}

struct AccessibilityStrategy: AccessibilityStrategyProtocol {

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.caretLocation > element.lineStart {
            element.caretLocation -= 1
        }
        
        return element
    }
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        // TODO
        // this will need to be refactored.
        // TextEngine... engine?
        let lineStart = element.internalText.index(element.internalText.startIndex, offsetBy: element.lineStart)
        let lineEnd = element.internalText.index(lineStart, offsetBy: element.lineEnd - element.lineStart)
        
        let limit = element.internalText[lineStart..<lineEnd].hasSuffix("\n") ? element.lineEnd - 2 : element.lineEnd - 1

        if element.caretLocation < limit {
            element.caretLocation += 1
        }

        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        let lineStart = element.internalText.index(element.internalText.startIndex, offsetBy: element.lineStart)
        let lineEnd = element.internalText.index(lineStart, offsetBy: element.lineEnd - element.lineStart)

        let limit = element.internalText[lineStart..<lineEnd].hasSuffix("\n") ? element.lineEnd - 2 : element.lineEnd - 1

        element.caretLocation = limit

        return element
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        element.caretLocation = element.lineStart

        return element
    }

    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        switch status {
        case .on:
            element = h(on: element)!
            element.selectedLength = 1
        case .off:
            element.selectedLength = 0
        }

        return element
    }

    static func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityTextElementAdaptor.toAXFocusedElememt(from: element)
    }
    
}
