@testable import kindaVim
import XCTest


class UsingASNM_rightBracketRightBrace_Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .rightBracket))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .rightBrace))
    }
    
}


extension UsingASNM_rightBracketRightBrace_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "rightBracketRightBrace(on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
