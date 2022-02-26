@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_rightArrow_Tests: KSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .rightArrow))
    }

}


extension KSNM_rightArrow_Tests {
    
    func test_that_l_calls_the_l_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "l(times:)")
    }
    
    func test_that_l_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
