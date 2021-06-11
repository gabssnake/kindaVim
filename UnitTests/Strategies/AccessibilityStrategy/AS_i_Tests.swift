@testable import kindaVim
import XCTest


class AS_i_Tests: AS_BaseTests {}


// Both
extension AS_i_Tests {
    
    func test_that_it_does_nothing_lol() {
        let text = "i just doesn't do shit lol. so lazy"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 24,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 35
            )
        )
        
        let returnedElement = accessibilityStrategy.i(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 24)     
    }    
   
    func test_that_it_drops_the_block_cursor() {
        let text = "checking the block cursor status when calling that shit move!"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 0,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 12
            )
        )
        
        let returnedElement = accessibilityStrategy.i(on: element)
        
        XCTAssertEqual(returnedElement?.selectedLength, 0)
    }
    
}
