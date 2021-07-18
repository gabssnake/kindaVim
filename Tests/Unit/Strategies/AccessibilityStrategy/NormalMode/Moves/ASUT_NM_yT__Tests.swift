@testable import kindaVim
import XCTest


// see other yt/f blah blah
class ASNM_yT__Tests: ASNM_BaseTests {
    
    private func applyMove(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.yT(to: character, on: element) 
    }
    
}


// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension ASNM_yT__Tests {
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_nothing_lol() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 0
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases yT", forType: .string)
        
        let returnedElement = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 1 of The 3 Cases yT")
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_works_and_do_nothing_lol() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 31,
            caretLocation: 31,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases yT", forType: .string)
        
        let returnedElement = applyMove(to: "a", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "test 3 of The 3 Cases yT")
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }  
    
}


// Both
extension ASNM_yT__Tests {
    
    func test_that_in_normal_setting_it_copies_the_text_from_the_character_found_the_caret_and_move_the_caret_to_the_character_found() {
        let text = "gonna use yT on this sentence"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 29,
            caretLocation: 24,
            selectedLength: 1,
            selectedText: "t",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 29
            )
        )
        
        let returnedElement = applyMove(to: "T", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), " on this sen")
        XCTAssertEqual(returnedElement?.caretLocation, 12)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_character_is_not_found_then_it_does_nothing() {
        let text = """
gonna look
for a character
that is not there
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 44,
            caretLocation: 14,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 11,
                end: 27
            )
        )
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("404 character not found", forType: .string)
        
        let returnedElement = applyMove(to: "z", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "404 character not found")
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASNM_yT__Tests {
    
    func test_that_it_can_find_the_character_on_a_line_for_a_multiline() {
        let text = """
yT on a multiline
should work 
on a line
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 40,
            caretLocation: 14,
            selectedLength: 1,
            selectedText: "i",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 18
            )
        )
        
        let returnedElement = applyMove(to: "y", on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "T on a multil")
        XCTAssertEqual(returnedElement?.caretLocation, 1)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
