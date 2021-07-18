import XCTest


class ASUI_VML_l_Tests: ASUI_VM_BaseTests {}


// currently same as Characterwise, so not bothering
// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension ASUI_VML_l_Tests {}


// Both
extension ASUI_VML_l_Tests {
    
    func test_that_in_visual_linewise_it_does_nothing() {
        let textInAXFocusedElement = "l will only move stuff in VM characterwise"
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)     
        KindaVimEngine.shared.enterNormalMode()
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .h))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, "l will only move stuff in VM characterwise")
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
        XCTAssertEqual(accessibilityElement?.selectedLength, 42)
    }
    
}
