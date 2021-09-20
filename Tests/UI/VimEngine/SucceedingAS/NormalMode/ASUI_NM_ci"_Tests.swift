@testable import kindaVim
import XCTest
import KeyCombination
import AccessibilityStrategy


// here we're just testing whether ci" returns in insert mode when successful, or in
// normal mode when it cannot apply the change. this need to be done here because the way
// to test whether it needs to get back to insert mode or stay in normal mode requires the
// AXUIElement. if it can't get the AXUIElement, for sure it would stay in normal mode.
class UIASNM_ciDoubleQuote_Tests: ASUI_NM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .doubleQuote))
    }

}


extension UIASNM_ciDoubleQuote_Tests {

    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
hehe there's gonna be some "double quotes" in that shit
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        KindaVimEngine.shared.enterNormalMode()

        applyKeyCombinationsBeingTested()

        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

    func test_a_case_where_it_should_not_delete_the_content_and_then_stay_in_normal_mode() {
        let textInAXFocusedElement = """
huhu only one " in there...
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        KindaVimEngine.shared.enterNormalMode()

        applyKeyCombinationsBeingTested()

        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
