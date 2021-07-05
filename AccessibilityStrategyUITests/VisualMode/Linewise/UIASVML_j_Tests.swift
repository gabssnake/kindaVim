import XCTest


class UIASVML_j_Tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackAccessibilityElement() -> AccessibilityTextElement? {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        
        return applyMoveAndGetBackAccessibilityElement { focusedElement in
            asVisualMode.j(on: focusedElement)
        }
    }
    
}


// The 3 Cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVML_j_Tests {    
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_not_move() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.caretLocation, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_works_and_selects_the_whole_last_line() {
        let textInAXFocusedElement = """
   caret is
gonna be at the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        // enter Visual Mode Linewise and push the selection to the end
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))                
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.command])
                
        let finalElement = asVisualMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
        
        XCTAssertEqual(finalElement?.caretLocation, 12)
        XCTAssertEqual(finalElement?.selectedLength, 19)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_does_not_move() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()
              
        XCTAssertEqual(finalElement?.caretLocation, 35)
    }
    
}


// TextFields
extension UIASVML_j_Tests {
    
    func test_that_in_TextFields_basically_it_does_nothing() {
        let textInAXFocusedElement = "hehe you little fucker"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()        
        
        XCTAssertEqual(finalElement?.caretLocation, 0)
        XCTAssertEqual(finalElement?.selectedLength, 22)
    }
    
}


// TextViews
extension UIASVML_j_Tests {
    
    // we go down twice coz once worked but twice didn't hehe :))
    func test_that_if_the_head_is_after_the_anchor_then_it_extends_the_selection_by_one_line_below_at_a_time() {
        let textInAXFocusedElement = """
so pressing j in
Visual Mode is gonna be
cool because it will extend
the selection
when the head is after the anchor
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        VimEngine.shared.enterNormalMode()
        
        let finalElement = applyMoveAndGetBackAccessibilityElement()
        
        XCTAssertEqual(finalElement?.caretLocation, 0)
        XCTAssertEqual(finalElement?.selectedLength, 41)
        
        let finalFinalElementHehe = asVisualMode.j(on: finalElement)
        
        XCTAssertEqual(finalFinalElementHehe?.caretLocation, 0)
        XCTAssertEqual(finalFinalElementHehe?.selectedLength, 69)        
    }
    
    func test_that_if_the_head_is_before_the_anchor_then_it_reduces_the_selection_by_one_line_below_at_a_time() {
        let textInAXFocusedElement = """
so pressing j in
Visual Mode is gonna be
cool because it will reduce
the selection when the
head if before the anchor
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        
        // need to call k so that the anchor and head get updated properly
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        let finalElement = asVisualMode.j(on: AccessibilityTextElementAdaptor.fromAXFocusedElement())
                
        XCTAssertEqual(finalElement?.caretLocation, 41)
        XCTAssertEqual(finalElement?.selectedLength, 76)
        
        let finalFinalElementHehe = asVisualMode.j(on: finalElement)
        
        XCTAssertEqual(finalFinalElementHehe?.caretLocation, 69)
        XCTAssertEqual(finalFinalElementHehe?.selectedLength, 48)        
    }
    
}
