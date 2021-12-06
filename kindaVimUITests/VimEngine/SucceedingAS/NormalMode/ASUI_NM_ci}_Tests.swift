import XCTest
import KeyCombination
import AccessibilityStrategy


// see ci' for blah blah
class ASUI_NM_ciRightBrace_Tests: ASUI_NM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .rightBrace))
    }

}


extension ASUI_NM_ciRightBrace_Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
hoho { another pile of shit }
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .b))

        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_a_case_where_it_should_not_delete_the_content_and_then_stay_in_normal_mode() {
        let textInAXFocusedElement = """
hoho no bracket on that shit
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        kindaVimEngine.enterNormalMode()

        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
