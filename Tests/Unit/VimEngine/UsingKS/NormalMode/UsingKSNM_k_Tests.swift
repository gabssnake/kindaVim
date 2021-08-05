@testable import kindaVim
import XCTest

class UsingKS_k_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
    }

}

extension UsingKS_k_Tests {

    func test_that_k_calls_the_k_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "k()")
    }
    
    func test_that_k_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

