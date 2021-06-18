@testable import kindaVim
import XCTest


class findPreviousUnmatchedLeftBraceTests: TextEngineBaseTests {}


// Both
extension findPreviousUnmatchedLeftBraceTests {
    
    func test_that_in_normal_setting_it_finds_the_previous_unmatched_bracket_type() {
        let text = "that one's { gonna sting { lol }"
        
        let location = textEngine.findPreviousUnmatchedLeftBrace(before: 29, in: text)
        
        XCTAssertEqual(location, 25)          
    }
    
    func test_that_it_returns_nil_if_there_is_no_left_brace() {
        let text = "no left brace in here move along"
        
        let location = textEngine.findPreviousUnmatchedLeftBrace(before: 19, in: text)
        
        XCTAssertNil(location)
    }
    
    func test_that_it_returns_nil_if_there_are_only_matched_left_braces() {
        let text = "full of { } matched { braces }"
        
        let location = textEngine.findPreviousUnmatchedLeftBrace(before: 30, in: text)

        XCTAssertNil(location)
    }
    
    func test_that_if_the_caret_is_at_the_left_brace_it_will_find_the_previous_one() {
        let text = """
caret just { before
the second brace { yes
"""
        
        let location = textEngine.findPreviousUnmatchedLeftBrace(before: 37, in: text)
        
        XCTAssertEqual(location, 11)    
    }
    
    func test_that_if_the_caret_is_right_after_the_left_brace_then_it_finds_that_brace() {
        let text = """
caret
is right after
the { second
brace { yes
again
"""
        
        let location = textEngine.findPreviousUnmatchedLeftBrace(before: 41, in: text)
        
        XCTAssertEqual(location, 40)    
    }
    
}
