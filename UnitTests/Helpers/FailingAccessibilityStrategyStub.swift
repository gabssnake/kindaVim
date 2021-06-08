@testable import kindaVim
import Foundation

struct FailingAccessibilityStrategyStub: AccessibilityStrategyProtocol {
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func A(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func cc(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func f(to: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func F(to: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func O(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func t(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func T(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
}
