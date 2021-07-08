@testable import kindaVim
import XCTest


class ASVML_y_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.visualStyle = .linewise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.y(on: element) 
    }
    
}


// currently same as Characterwise
// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension ASVML_y_Tests {}


// Both
extension ASVML_y_Tests {
    
    func test_that_it_sets_the_Last_Yanking_Style_to_Linewise() {
        let text = """
using VM y in VM V
should set Visual Style
to Linewise
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 54,
            caretLocation: 6,
            selectedLength: 24,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 19
            )
        )
        
        VimEngine.shared.lastYankStyle = .characterwise
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(VimEngine.shared.lastYankStyle, .linewise)
    }
    
    func test_that_for_TextFields_it_yanks_the_whole_line() {
        let text = "a whole line entirely for VM V and VM y"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 39,
            caretLocation: 0,
            selectedLength: 39,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 39
            )
        )
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "a whole line entirely for VM V and VM y")        
    }
    
}


// TextViews
extension ASVML_y_Tests {
    
    func test_that_for_TextViews_it_yanks_the_selected_lines() {
        let text = """
gonna be dealing
with VM V over
why the fuck am
i writing this?
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 63,
            caretLocation: 17,
            selectedLength: 46,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 17,
                end: 32
            )
        )
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), """
with VM V over
why the fuck am
i writing this?
"""
        )
    }
    
    func test_that_after_yanking_it_gets_back_to_the_caret_position() {
        let text = """
yes even in multilne
it goes back to
the crazy caret location and
not the anchor!
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 81,
            caretLocation: 21,
            selectedLength: 45,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 21,
                end: 37
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 21)
    }
    
}
