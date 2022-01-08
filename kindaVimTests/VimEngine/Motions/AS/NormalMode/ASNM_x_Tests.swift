@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_x_Tests: ASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .x))
    }
    
}


extension SucceedingASNM_x_Tests {
    
    // synonym
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "dl(on:_:)")
    }
    
    func test_that_l_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.state.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
