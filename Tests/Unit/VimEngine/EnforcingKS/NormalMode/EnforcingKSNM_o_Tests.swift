@testable import kindaVim
import XCTest


class EnforcingKS_o_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .o),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_o_Tests {
    
    func test_that_o_calls_the_o_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "o()")
    }
    
    func test_that_o_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}



