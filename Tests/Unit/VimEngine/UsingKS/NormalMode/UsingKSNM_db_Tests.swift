@testable import kindaVim
import XCTest

class UsingKS_db_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
    }

}

extension UsingKS_db_Tests {

    func test_that_db_calls_the_db_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "db()")
    }

    func test_that_db_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}

