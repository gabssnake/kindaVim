@testable import kindaVim
import XCTest

// this is tested more deeply by
// 1. test of the TextEngine function this move is calling
// 2. AS UI Tests where we tests that the globalColumnNumber is updated
//    correctly when the caret changes line due to this move
class AS_b_Tests: AS_BaseTests {}

// Both
extension AS_b_Tests {
    
    func test_that_it_calls_the_TextEngine_wordBackward_function() {
        let text = """
just testing call to wordBackward
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            caretLocation: 49,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 34,
                end: 62
            )
        )
        
        _ = accessibilityStrategy.b(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "wordBackward(for:playground:)")        
    }
    
}
