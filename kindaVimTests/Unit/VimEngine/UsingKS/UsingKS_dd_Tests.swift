@testable import kindaVim
import XCTest

class UsingKS_dd_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
    }

}

extension UsingKS_dd_Tests {
    
    func test_that_dd_calls_the_dd_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "dd()")
    }
    
    func test_that_dd_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}

