import XCTest


class UIASVML_0_Tests: UIAS_BaseTests {}


// currently same as Characterwise, so not bothering
// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVML_0_Tests {}


// Both
extension UIASVML_0_Tests {
    
    func test_that_in_visual_linewise_it_does_nothing() {
        let textInAXFocusedElement = "0 will only move stuff in VM characterwise"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)     
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .zero))        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, "0 will only move stuff in VM characterwise")
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 42)
    }
    
}
