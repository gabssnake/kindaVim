@testable import kindaVim
import XCTest


// read p for more blah blah
class UIAS_P__TextFields_Tests: UIAS_BaseTests {
    
    private func sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .p, shift: true))
        
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()        
    }    
    
}


// same as p. The 3 Cases but only 2 because no empty line for TextFields
// - empty TextElement
// - caret at the end of TextElement but not on empty line
extension UIAS_P__TextFields_Tests {
    
    func test_that_if_the_TextField_is_empty_it_still_pastes() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases P TF", forType: .string)
        
        VimEngine.shared.lastYankStyle = .characterwise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement() 
        
        XCTAssertEqual(finalElement?.value, "test 1 of The 3 Cases P TF")
        XCTAssertEqual(finalElement?.caretLocation, 25)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextField_it_does_nothing_and_does_not_crash() {
        let textInAXFocusedElement = "oh oh you're out of the boundaries!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 2 of The 3 Cases P TF", forType: .string)
        
        VimEngine.shared.lastYankStyle = .characterwise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "oh oh you're out of the boundaries!")
        XCTAssertEqual(finalElement?.caretLocation, 34)
    }
    
}


// characterwise
extension UIAS_P__TextFields_Tests {
    
    func test_that_in_normal_setting_it_pastes_the_text_at_the_caret_position_and_the_block_cursor_ends_up_at_the_end_of_the_pasted_text() {
        let textInAXFocusedElement = "pasta pizza"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("text to pasta pizza!!!", forType: .string)
        
        VimEngine.shared.lastYankStyle = .characterwise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "pasta text to pasta pizza!!!pizza")
        XCTAssertEqual(finalElement?.caretLocation, 27)
    }
    
}


// linewise
extension UIAS_P__TextFields_Tests {
    
    func test_that_even_if_the_last_yank_was_linewise_it_still_pastes_as_characterwise_at_the_caret_location_and_the_block_cursor_ends_up_at_the_end_of_the_pasted_text() {
        let textInAXFocusedElement = "P linewise for TF is still pasted characterwise!"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("paste me daddy", forType: .string)
        
        VimEngine.shared.lastYankStyle = .linewise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "paste me daddyP linewise for TF is still pasted characterwise!")
        XCTAssertEqual(finalElement?.caretLocation, 13)
    }
    
    func test_that_when_the_last_yank_was_linewise_and_the_line_was_ending_with_a_linefeed_the_linefeed_is_not_pasted_in_the_TextField() {
        let textInAXFocusedElement = "P should not paste linefeeds in the TF"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("yanked with the linefeed hum hum\n", forType: .string)
        
        VimEngine.shared.lastYankStyle = .linewise
        let finalElement = sendMoveThroughVimEngineAndGetBackUpdatedFocusedElement()
        
        XCTAssertEqual(finalElement?.value, "P should not paste linefeeds in theyanked with the linefeed hum hum TF")
        XCTAssertEqual(finalElement?.caretLocation, 66)
    }
    
}
