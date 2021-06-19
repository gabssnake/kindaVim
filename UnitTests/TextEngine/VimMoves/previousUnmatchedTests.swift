@testable import kindaVim
import XCTest


class previousUnmatchedTests: TextEngineBaseTests {}


// Both
extension previousUnmatchedTests {
        
    func test_that_in_normal_setting_it_goes_to_the_previous_unmatched_bracket() {
        let text = "that one's { gonna sting { lo"
        
        let location = textEngine.previousUnmatched("{", before: 29, in: text)
        
        XCTAssertEqual(location, 25)
    }
    
    func test_that_it_does_not_move_if_it_cannot_find_a_previous_unmatched_bracket() {
        let text = "no left brace in here move along"
        
        let location = textEngine.previousUnmatched("(", before: 19, in: text)
        
        XCTAssertEqual(location, 19)
    }
    
    func test_that_it_does_not_move_if_there_are_only_matched_brackets() {
        let text = "full of ( ) matched ( braces )"
        
        let location = textEngine.previousUnmatched("(", before: 30, in: text)

        XCTAssertEqual(location, 30)
    }
    
    func test_that_if_the_caret_is_right_before_a_bracket_it_will_still_go_to_the_previous_one() {
        let text = """
caret just ( before
the second brace ( yes
"""
        
        let location = textEngine.previousUnmatched("(", before: 37, in: text)
        
        XCTAssertEqual(location, 11)
    }
    
    func test_that_if_the_caret_is_right_after_a_left_bracket_it_still_goes_to_that_bracket() {
        let text = """
caret
is right after
the { second
brace { yes
again
"""
        
        let location = textEngine.previousUnmatched("{", before: 41, in: text)
        
        XCTAssertEqual(location, 40)
    }
    
    func test_that_it_works_with_a_lot_of_brackets_lol() {
        let text = "(   (    (   )   )     "
        
        let location = textEngine.previousUnmatched("(", before: 23, in: text)
        
        XCTAssertEqual(location, 0)
    }
    
    func test_that_it_does_not_explore_with_string_out_of_bounds_like_before() {
        let text = "that one's { gonna s}ting { lo"
        
        let location = textEngine.previousUnmatched("{", before: 30, in: text)
        
        XCTAssertEqual(location, 26)
    }
    
    func test_whatever_to_sleep_better_at_night() {
        let text = " a couple of ( ( )"
        
        let location = textEngine.previousUnmatched("(", before: 15, in: text)
        
        XCTAssertEqual(location, 13)
    }
    
    func test_that_in_normal_cases_it_works_hehe() {
        let text = "a couple of ( (( ))))  ) O_o"
        
        let location = textEngine.previousUnmatched("(", before: 19, in: text)
        
        XCTAssertEqual(location, 12)
    }
    
}
