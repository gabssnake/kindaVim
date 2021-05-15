@testable import kindaVim
import XCTest

class UsingKS_control_d_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d, control: true))
    }

}

extension UsingKS_control_d_Tests {
    
    func test_that_control_d_calls_the_controlD_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "controlD()")
    }
    
    func test_that_control_d_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}

