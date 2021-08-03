@testable import kindaVim
import XCTest

class UsingKS_control_u_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .u, control: true))
    }

}

extension UsingKS_control_u_Tests {
    
    func test_that_control_u_calls_the_controlU_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "controlU()")
    }
    
    func test_that_control_u_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
