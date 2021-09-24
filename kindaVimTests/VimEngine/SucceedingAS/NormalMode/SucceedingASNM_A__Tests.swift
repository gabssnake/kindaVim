@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_A__Tests: SucceedingASNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .A))
    }

}


extension SucceedingASNM_A__Tests {

    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "A(on:)")
    }

    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}