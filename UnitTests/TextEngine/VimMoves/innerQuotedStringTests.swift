@testable import kindaVim
import XCTest


class innerQuotedString: TextEngineBaseTests {}


// Both
extension innerQuotedString {
    
    func test_that_if_there_is_no_quote_then_it_returns_nil() {
        let text = "yep no quote in here"
        
        XCTAssertNil(
            textEngine.innerQuotedString(using: "\"", startingAt: 2, in: text)
        )
    }
    
    func test_that_if_there_is_only_one_quote_then_it_returns_nil_also() {
        let text = "only one quote in 'there"
        
        XCTAssertNil(
            textEngine.innerQuotedString(using: "'", startingAt: 7, in: text)
        )
    }
    
    func test_that_if_there_are_two_quotes_and_the_caret_is_before_them_then_it_can_find_the_text() {
        let text = "finally some serious 'gourmet' shit"
        
        guard let (textStartLocation, textEndLocation) = textEngine.innerQuotedString(using: "'", startingAt: 4, in: text) else { return XCTFail() }
        
        XCTAssertEqual(textStartLocation, 22)
        XCTAssertEqual(textEndLocation, 29) 
    }
    
    func test_that_if_there_are_two_quotes_and_the_caret_is_between_them_then_it_can_find_the_text() {
        let text = "wow now we're gonna eat shit a bit' lol"
        
        guard let (textStartLocation, textEndLocation) = textEngine.innerQuotedString(using: "'", startingAt: 15, in: text) else { return XCTFail() }
        
        XCTAssertEqual(textStartLocation, 11)
        XCTAssertEqual(textEndLocation, 34) 
    }
    
    func test_that_if_there_are_two_quotes_and_the_caret_is_after_them_then_it_returns_nil() {
        let text = "pretty `tough` if you ask me"
        
        XCTAssertNil(
            textEngine.innerQuotedString(using: "`", startingAt: 18, in: text)
        )
    }
    
    func test_that_if_there_are_three_quotes_it_finds_the_correct_text() {
        let text = "that's \" three quotes \" in there \""
        
        guard let (textStartLocation, textEndLocation) = textEngine.innerQuotedString(using: "\"", startingAt: 29, in: text) else { return XCTFail() }
        
        XCTAssertEqual(textStartLocation, 23)
        XCTAssertEqual(textEndLocation, 33) 
    }
    
    func test_that_if_the_caret_is_on_a_quote_then_it_calculates_the_matching_pairs_and_finds_the_correct_text() throws {
        throw XCTSkip("currently not handled. gonna wait a bit before making the brain bleed.")
    }    
    
}

