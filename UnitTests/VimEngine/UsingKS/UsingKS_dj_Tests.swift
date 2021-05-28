@testable import kindaVim
import XCTest

class UsingKS_dj_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
    }

}

extension UsingKS_dj_Tests {
    
    func test_that_dj_calls_the_dj_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "dj()")
    }
    
    func test_that_dj_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
