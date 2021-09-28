@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_h_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .h), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_h_Tests {
    
    func test_that_h_calls_the_h_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "h()")
    }
    
    func test_that_h_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
