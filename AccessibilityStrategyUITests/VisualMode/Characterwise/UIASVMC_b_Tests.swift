import XCTest


// the 3 cases are already done in Unit Tests. the UI for b is just to test a special case
class UIASVMC_b_Tests: UIAS_BaseTests {}


extension UIASVMC_b_Tests {

    func test_that_when_we_reach_the_anchor_and_will_reverse_anchor_and_head_the_b_move_does_not_block_and_moves_properly() {
        let textInAXFocusedElement = """
in Visual Mode Characterwise we
always move from the anchor, not
from the caret location
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)        
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))        
        var accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 53)
        XCTAssertEqual(accessibilityElement?.selectedLength, 2)
        
        // the second pass is where it would block if we don't update Self.anchor manually
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))        
        accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 49)
        XCTAssertEqual(accessibilityElement?.selectedLength, 6)        
    }  
    
}
