@testable import kindaVim
import XCTest

class wordForwardTests: TextEngineBaseTests {}

// Both
extension wordForwardTests {
    
    func test_that_it_can_go_to_the_beginning_of_the_next_word() {
        let text = "a few words to live by"
        
        let newCaretPosition = textEngine.wordForward(for: 6, playground: text)
        
        XCTAssertEqual(newCaretPosition, 12)
    }
    
    func test_that_it_stops_at_punctuations() {
        let text = "class wordForwardTests: XCTestCase {"
        
        let newCaretPosition = textEngine.wordForward(for: 8, playground: text)
        
        XCTAssertEqual(newCaretPosition, 22)
    }
    
    func test_that_it_does_not_get_blocked_at_a_punctuation() {
        let text = "textEngine.wordForward"
        
        let newCaretPosition = textEngine.wordForward(for: 10, playground: text)
        
        XCTAssertEqual(newCaretPosition, 11)
    }
    
    func test_that_it_does_not_stop_at_an_underscore() {
        let text = "func test_that_it_does_not_stop_at_an_underscore() {"
        
        let newCaretPosition = textEngine.wordForward(for: 5, playground: text)
        
        XCTAssertEqual(newCaretPosition, 48)
    }
    
    func test_that_it_passes_several_consecutive_whitespaces() {
        let text = "this is some text with        space"
        
        let newCaretPosition = textEngine.wordForward(for: 20, playground: text)
        
        XCTAssertEqual(newCaretPosition, 30)
    }

    func test_that_if_it_reaches_the_end_of_the_buffer_it_stops_before_the_last_character() {
        let text = "w at the end of the buffer shouldn't craaaash"

        let newCaretPosition = textEngine.wordForward(for: 42, playground: text)

        XCTAssertEqual(newCaretPosition, 44)
    }
    
    func test_that_it_passes_several_consecutive_punctuations() {
        let text = "for index in text[anchorIndex..<endIndex].indices {"
        
        let newCaretPosition = textEngine.wordForward(for: 29, playground: text)
        
        XCTAssertEqual(newCaretPosition, 32)
    }
    
    func test_that_it_does_not_stop_at_a_space_after_a_punctuation() {
        let text = "let anchorIndex = text.index(text.startIndex, offsetBy: location)"
        
        let newCaretPosition = textEngine.wordForward(for: 54, playground: text)
        
        XCTAssertEqual(newCaretPosition, 56)
    }
    
    func test_that_it_does_not_stop_at_a_space_after_a_symbol() {
        let text = "guard index != text.index(before: endIndex) else { return text.count - 1 }"
        
        let newCaretPosition = textEngine.wordForward(for: 12, playground: text)
        
        XCTAssertEqual(newCaretPosition, 15)
    }
    
    func test_that_it_does_not_stop_at_a_space_after_a_number() {
        let text = "guard index != text.index(before: endIndex) else { return text.count - 1 }"
        
        let newCaretPosition = textEngine.wordForward(for: 71, playground: text)
        
        XCTAssertEqual(newCaretPosition, 73)
    }
    
    func test_that_it_stops_at_underscores_that_are_not_part_of_a_word() {
        let text = """
if text[nextIndex] == "_" {
"""
        
        let newCaretPosition = textEngine.wordForward(for: 22, playground: text)
        
        XCTAssertEqual(newCaretPosition, 23)
    }
    
    func test_that_it_stops_at_punctuations_that_are_preceded_by_an_underscore() {
        let text = """
if text[nextIndex] == "_" {
"""
        
        let newCaretPosition = textEngine.wordForward(for: 23, playground: text)
        
        XCTAssertEqual(newCaretPosition, 24)
    }
    
    func test_that_it_does_not_stop_at_numbers_that_are_part_of_a_word() {
        let text = "saf sadfhasdf4asdf dfd"
        
        let newCaretPosition = textEngine.wordForward(for: 5, playground: text)
        
        XCTAssertEqual(newCaretPosition, 19)
    }

}

// TextViews
extension wordForwardTests {

    func test_that_it_does_not_get_blocked_on_a_line() {
        let text = """
w can go
to the next line
"""

        let newCaretPosition = textEngine.wordForward(for: 7, playground: text)

        XCTAssertEqual(newCaretPosition, 9)
    }
    
    func test_that_it_stops_at_an_empty_line() {
        let text = """
w should stop

at empty lines
"""
        
        let newCaretPosition = textEngine.wordForward(for: 12, playground: text)
        
        XCTAssertEqual(newCaretPosition, 14)
    }

    func test_that_it_does_not_stop_at_a_line_that_has_just_whitespaces() {
        let text = """
w shouldn't stop
at the following line that looks empty but has
   
whitespaces
"""

        let newCaretPosition = textEngine.wordForward(for: 63, playground: text)

        XCTAssertEqual(newCaretPosition, 68)
    }

}
