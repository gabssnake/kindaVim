import Foundation


protocol AccessibilityStrategyProtocol {

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func cc(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciw(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func f(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func F(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
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
    func x(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    func caret(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func underscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement?
}


struct AccessibilityStrategy: AccessibilityStrategyProtocol {
    
    var textEngine: TextEngineProtocol = TextEngine()
    
    
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
