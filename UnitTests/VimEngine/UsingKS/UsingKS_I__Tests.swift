@testable import kindaVim
import XCTest

class UsingKS_I_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .I))
    }

}

extension UsingKS_I_Tests {
    
    func test_that_I_switches_Vim_to_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
    func test_that_I_calls_the_I_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "I()")
    }

}
