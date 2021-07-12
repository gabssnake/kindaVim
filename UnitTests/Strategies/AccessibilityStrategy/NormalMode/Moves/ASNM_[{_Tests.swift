@testable import kindaVim
import XCTest


// this move uses the TextEngine.findPreviousUnmatched function
// so the tests will be there.
// no need for The 3 Cases as it's text-based not AX API base so we will
// always make it work.
class ASNM_leftBrackerLeftBrace_Tests: ASNM_BaseTests {
    
    let textEngineMock = TextEngineMock()
    
    override func setUp() {
        super.setUp()
        
        asNormalMode = AccessibilityStrategyNormalMode(textEngine: textEngineMock)
    }    
    
}


// Both
extension ASNM_leftBrackerLeftBrace_Tests {
    
    func test_that_it_calls_the_TextEngine_findPreviousUnmatched_function() {
        let text = """
just testing call to findPreviousUnmatched
all the cases are tested in
the TextEngineTests
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 90,
            caretLocation: 50,
            selectedLength: 1,
            selectedText: " ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 43,
                end: 71
            )
        )
        
        _ = asNormalMode.leftBracketLeftBrace(on: element)
        
        XCTAssertEqual(textEngineMock.functionCalled, "previousUnmatched(_:before:in:)")        
    }
    
}
