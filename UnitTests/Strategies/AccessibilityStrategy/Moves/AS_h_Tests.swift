@testable import kindaVim
import XCTest


class AS_h_Tests: AS_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return accessibilityStrategy.h(on: element) 
    }
    
}


// Both
extension AS_h_Tests {
    
    func test_that_in_normal_setting_h_goes_one_character_to_the_left() {
        let text = "h goes one character to the left"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 16,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 32
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 15)
    }
    
    func test_that_for_an_empty_Text_AXUIElement_h_does_not_move() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
    func test_that_at_the_beginning_of_a_Text_AXUIElement_h_does_not_move() {
        let text = """
if at beginning of a Text AXUIElement
h should not move
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 38
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 0)
    }
    
    func test_that_at_the_end_a_Text_AXUIElement_h_does_move() {
        let text = """
if at the end of a AXUIElement
h should move if not
if not on a last empty line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 79,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, text.count - 1)
    }
    
}


// TextAreas
extension AS_h_Tests {

    func test_that_at_the_beginning_of_a_line_h_does_not_move_up_to_the_prevous_line_in_TextAreas() {
        let text = """
in multiline if
at the beginning of a line
h should not go up to
the previous line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 43,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 43,
                end: 65
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 43)
    }
    
    func test_that_if_caret_is_on_last_empty_line_h_does_not_up_one_line() {
        let text = """
multi with
stupid last empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 34,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: nil,
                start: nil,
                end: nil
            )
        )

        let returnedElement = applyMove(on: element)

        XCTAssertEqual(returnedElement?.caretLocation, 34)
    }

}
