@testable import kindaVim
import Foundation
import AccessibilityStrategy


struct FailingAccessibilityStrategyNormalModeStub: AccessibilityStrategyNormalModeProtocol {
    
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
    
    func B(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func C(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func cc(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func cf(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func cF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func caw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func cgg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func cG(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciBacktick(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciLeftBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciRightBracket(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ciSingleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ct(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func cT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func D(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func daw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func dd(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func df(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func dF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func dj(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func dk(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func dt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func dT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func E(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func f(to: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func F(to: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gCaret(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
       
    func gDollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
       
    func gZero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func ge(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gE(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gj(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func gk(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
    
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func o(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func O(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func pForLastYankStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func pForLastYankStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func PForLastYankStyleCharacterwise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func PForLastYankStyleLinewise(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func r(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func controlR(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil        
    }
    
    func t(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func T(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func u(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func v(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func V(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func W(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func x(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yf(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiBacktick(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
        
    func yiSingleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiLeftBrace(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiLeftBracket(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiLeftParenthesis(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        return nil
    }
        
    func yiRightBrace(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiRightBracket(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiRightParenthesis(on element: AccessibilityTextElement?, _ lastYankStyle: inout VimEngineMoveStyle) -> AccessibilityTextElement? {
        return nil
    }
    
    func yiw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func caret(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func leftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func leftBracketLeftBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func leftBracketLeftParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func leftChevronLeftChevron(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func percent(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func rightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func rightBracketRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func rightBracketRightParenthesis(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func rightChevronRightChevron(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
    func underscore(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return nil
    }
    
}
