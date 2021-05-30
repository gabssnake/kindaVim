@testable import kindaVim
import XCTest

// this is tested more deeply by
// 1. test of the TextEngine function this move is calling
// 2. AS UI Tests where we tests that the globalColumnNumber is updated
//    correctly when the caret changes line due to this move
class AS_w_Tests: AS_BaseTests {}

// Both
extension AS_w_Tests {

    func test_that_it_calls_the_TextEngine_wordForward_function() {
        let text = "should be calling wordForward"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            caretLocation: 11,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 0,
                start: 0,
                end: 29
            )
        )
        
        _ = accessibilityStrategy.w(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "wordForward(for:playground:)")        
    }

}

