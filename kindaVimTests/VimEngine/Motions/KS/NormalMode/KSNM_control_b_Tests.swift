@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_control_b_Tests: KSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .b, control: true))
    }

}


extension KSNM_control_b_Tests {
    
    func test_that_control_d_calls_the_controlD_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "controlB()")
    }
    
    func test_that_control_d_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
      
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
