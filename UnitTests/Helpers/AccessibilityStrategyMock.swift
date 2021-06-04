@testable import kindaVim
import Foundation

class AccessibilityStrategyMock: AccessibilityStrategyProtocol {
    
    var functionCalled = ""
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return nil
    }
    
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return nil
    }
    
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return nil
    }
    
    func f(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return nil
    }
    
    func F(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return nil
    }

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }
    
    func i(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return nil
    }
    
    func I(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return nil
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }
    
    func t(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return nil
    }
    
    func T(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function
        
        return nil
    }

    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        functionCalled = #function

        return nil
    }

}
