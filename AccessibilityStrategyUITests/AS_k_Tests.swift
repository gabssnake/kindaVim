@testable import kindaVim
import XCTest

class AS_k_Tests: AS_BaseTests {}

// TextFields
extension AS_k_Tests {

    func test_that_for_TextFields_k_returns_nil_coz_we_want_the_KS_to_take_over() {
        let textInAXFocusedElement = "k on a TextField shouldn't use the AS! think Alfred"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        
        let accessibilityElement = accessibilityStrategy.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertNil(accessibilityElement)
    }

}

// TextViews
extension AS_k_Tests {

    func test_that_in_normal_setting_k_goes_to_the_previous_line_at_the_same_column() {
        let textInAXFocusedElement = """
so now we're
testing k and
it should go up
to the same column
"""

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .h))

        let accessibilityElement = accessibilityStrategy.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 38)
    }

    func test_that_if_the_previous_line_is_shorter_k_goes_to_the_end_of_line_limit_of_that_previous_line() {
        let textInAXFocusedElement = """
a line
shorter than
the previous shorter
than the previous shorter than...
"""

        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .h))
        
        let accessibilityElement = accessibilityStrategy.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 39)
    }

    func test_that_the_column_number_is_saved_and_reapplied_properly() {
        let textInAXFocusedElement = """
first one is prettyyyyy long too
a pretty long line i would believe
a shorter line
another quite long line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])

        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .h))
        
        let firstK = accessibilityStrategy.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        _ = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: firstK!)
        
        XCTAssertEqual(firstK?.axCaretLocation, 81)
        
        let secondK = accessibilityStrategy.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        _ = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: secondK!)
        
        XCTAssertEqual(secondK?.axCaretLocation, 51)

        let thirdK = accessibilityStrategy.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(thirdK?.axCaretLocation, 18)
    }
    
    func test_that_when_at_the_first_line_k_does_nothing() {
        let textInAXFocusedElement = """
a the first line
k should do
nothing ankulay
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        
        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
        
        let accessibilityElement = accessibilityStrategy.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 1)
    }
    
    func test_that_when_current_line_column_is_equal_to_previous_line_length_the_caret_ends_up_at_the_right_previous_line_end_limit() {
        let textInAXFocusedElement = """
weird bug when
current line column
is equal
to previous line length
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        for _ in 1...7 {
            app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        }
        
        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
        
        let accessibilityElement = accessibilityStrategy.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(accessibilityElement?.axCaretLocation, 42)
    }

    func test_that_if_we_are_on_the_last_line_and_it_is_just_a_linefeed_we_can_still_go_up_and_follow_the_globalColumnNumber() {
        let textInAXFocusedElement = """
fucking hell
with the last line
empty

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])

        // need to move the caretLocation to have a proper AccessibilityTextElement.globalColumnNumber
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .l))

        let jFirst = accessibilityStrategy.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        _ = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: jFirst!)

        XCTAssertEqual(jFirst?.axCaretLocation, 38)

        let thenK = accessibilityStrategy.k(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())

        XCTAssertEqual(thenK?.axCaretLocation, 35)
    }
    
}
