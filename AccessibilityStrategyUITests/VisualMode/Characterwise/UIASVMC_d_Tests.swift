import XCTest


class UIASVMC_d_Tests: UIAS_BaseTests {}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVMC_d_Tests {    
    
    func test_that_if_the_TextElement_is_empty_it_works_and_deletes_NOTHING() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))        
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        let finalElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(finalElement?.caretLocation, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_goes_back_one_character_to_the_left() {
        let textInAXFocusedElement = """
   caret is
gonna be at the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))        
        let finalElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(finalElement?.value, """
   caret is
gonna be at the end
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 30)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_the_caret_goes_to_the_relevant_position() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))                
        let finalElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(finalElement?.value, """
caret is on its
own empty
    line
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 30)
    }
    
}


extension UIASVMC_d_Tests {
    
    func test_that_it_simply_deletes_the_selection() {
        let textInAXFocusedElement = """
all that VM d does
in characterwise is deleting
the selection!
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        // to replace by VM b/B once implemented
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.shift, .command])
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.option, .shift])
        
        // to remove once VM b/B are implemented and used
        AccessibilityStrategyVisualMode.head = 14
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        let finalElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(finalElement?.value, """
all that VM d ise is deleting
the selection!
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 14)        
    }
    
    func test_that_if_the_head_is_at_the_last_character_before_a_linefeed_when_deleted_then_the_caret_goes_to_the_new_line_end_limit_and_not_the_linefeed() {
        let textInAXFocusedElement = """
if deleting the last character of
a line before the linefeed the caret
should go back to line end limit
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
if deleting the last character of
a line before the linefeed the care
should go back to line end limit
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 68)       
    }
    
    func test_that_if_there_is_only_one_character_on_a_line_deleting_it_stays_on_the_line_and_does_not_go_to_the_linefeed_of_the_above_line() {
        let textInAXFocusedElement = """
if deleting the last character of
x
should go back to line end limit
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .zero))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
if deleting the last character of

should go back to line end limit
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 34)         
    }
    
}
