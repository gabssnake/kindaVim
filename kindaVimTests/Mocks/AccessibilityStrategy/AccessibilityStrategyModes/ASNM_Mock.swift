@testable import kindaVim
import Foundation
import AccessibilityStrategy
import Common


class AccessibilityStrategyNormalModeMock: AccessibilityStrategyNormalModeProtocol {
    
    var functionCalled = ""
    var relevantParameter = ""
    var lastLeftRightSearchParameter: LastLeftRightSearch?
    var lastSearchCommandParameter: LastSearchCommand?
    
    
    static func test(element: AccessibilityTextElement) -> AccessibilityTextElement {
        return element
    }

    func a(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func A(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func b(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func B(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func caW(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func caw(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cB(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cb(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cc(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cDollarSign(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cE(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ce(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cF(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func cf(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func cG(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cgg(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ch(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }

    func ciB(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cib(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciBacktick(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciDoubleQuote(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciLeftBrace(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciLeftBracket(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciLeftParenthesis(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cip(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciRightBrace(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciRightBracket(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciRightParenthesis(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciSingleQuote(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciW(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ciw(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cl(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }

    func comma(times count: Int?, lastLeftRightSearch: LastLeftRightSearch, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        lastLeftRightSearchParameter = lastLeftRightSearch

        return element
    }

    func controlR(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func cT(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func ct(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func cW(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func cw(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func daW(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func daw(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dB(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func db(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dDollarSign(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }

    func dd(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dE(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func de(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dF(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func df(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func dG(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dgg(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dh(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dip(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func diW(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func diw(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dj(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dk(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dl(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }

    func dT(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)

        
        return element
    }
    
    func dt(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func dW(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func dw(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func E(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func e(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func f(times count: Int?, to character: Character, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func F(times count: Int?, to character: Character, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func gCaret(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gDollarSign(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gI(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gUnderscore(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gZero(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func ge(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gg(times count: Int? = nil, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gE(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func gj(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func gk(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func G(times count: Int? = nil, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }

    func h(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func I(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func i(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func interrogationMark(times count: Int?, to searchString: String, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        lastSearchCommandParameter = LastSearchCommand(motion: .interrogationMark, searchString: searchString)
        
        return element
    }
    
    func J(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func j(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func k(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func l(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func N(times count: Int?, lastSearchCommand: LastSearchCommand, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        lastSearchCommandParameter = lastSearchCommand
        
        return element
    }
    
    func n(times count: Int?, lastSearchCommand: LastSearchCommand, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        lastSearchCommandParameter = lastSearchCommand
        
        return element
    }
    
    func O(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func o(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func P(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func p(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func r(times count: Int?, with replacement: Character, on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(replacement)
        
        return element
    }
    
    func `return`(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func T(times count: Int?, to character: Character, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func t(times count: Int?, to character: Character, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func tilde(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func u(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }

    func w(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func W(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yF(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func yf(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func yiw(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yiBacktick(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yiDoubleQuote(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
        
    func yiSingleQuote(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yiLeftBrace(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yiLeftBracket(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yiLeftParenthesis(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yiRightBrace(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yiRightBracket(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yiRightParenthesis(on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func yT(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func yt(times count: Int?, to character: Character, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        relevantParameter = String(character)
        
        return element
    }
    
    func yy(times count: Int?, on element: AccessibilityTextElement, _ vimEngineState: inout VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func caret(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }

    func dollarSign(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }
    
    func leftBrace(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func leftBracketLeftBrace(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func leftBracketLeftParenthesis(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func leftChevronLeftChevron(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func percent(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func rightBrace(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func rightBracketRightBrace(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func rightBracketRightParenthesis(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func rightChevronRightChevron(on element: AccessibilityTextElement, _ vimEngineState: VimEngineState) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }
    
    func semicolon(times count: Int?, lastLeftRightSearch: LastLeftRightSearch, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        lastLeftRightSearchParameter = lastLeftRightSearch

        return element
    }

    func slash(times count: Int?, to searchString: String, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        lastSearchCommandParameter = LastSearchCommand(motion: .slash, searchString: searchString)
        
        return element
    }
    
    func underscore(times count: Int?, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function
        
        return element
    }

    func zero(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        functionCalled = #function

        return element
    }

}
