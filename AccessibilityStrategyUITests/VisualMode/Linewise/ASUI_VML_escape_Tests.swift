import XCTest


class UIASVML_escape_Tests: UIAS_BaseTests {}


// currently same as Characterwise, so not bothering
// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVML_escape_Tests {}


// TextFields
extension UIASVML_escape_Tests {
    
    func test_that_the_caret_location_goes_to_the_head() {
        let textInAXFocusedElement = "some plain simple text for once"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))        
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 30)
    }
    
}


// TextViews
extension UIASVML_escape_Tests {
    
    func test_that_the_caret_location_goes_to_the_head_even_when_the_selection_spans_over_multiple_lines() {
        let textInAXFocusedElement = """
let's try with selecting
over multiple lines
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_if_the_head_is_above_line_end_limit_then_the_caret_goes_to_the_end_limit() {
        let textInAXFocusedElement = """
so this is definitely
gonna go after
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
    }    
    
}
