@testable import kindaVim
import XCTest

class UsingKS_g_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
    }

}

extension UsingKS_g_Tests {
    
    func test_that_g_does_not_call_any_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_after_the_first_g_operator_pending_mode_is_on() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .operatorPending)
    }

}

