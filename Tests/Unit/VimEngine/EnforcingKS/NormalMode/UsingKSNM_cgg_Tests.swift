@testable import kindaVim
import XCTest

class UsingKS_cgg_Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g), enforceKeyboardStrategy: true)
    }

}

extension UsingKS_cgg_Tests {

    func test_that_cgg_calls_the_cgg_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "cgg()")
    }

    func test_that_cgg_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}

