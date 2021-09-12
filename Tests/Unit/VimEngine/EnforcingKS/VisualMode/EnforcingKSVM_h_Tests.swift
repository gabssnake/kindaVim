@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_h_Tests: EnforcingKSVM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .h),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKSVM_h_Tests {

    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "h()")
    }

    func test_that_it_keeps_Vim_in_Visual_Mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }

}
