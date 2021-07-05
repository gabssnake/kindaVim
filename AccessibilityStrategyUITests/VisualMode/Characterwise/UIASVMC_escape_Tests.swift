import XCTest


class UIASVMC_escape_Tests: UIAS_BaseTests {}


// the 3 special cases:
// - empty TextElement
// - caret at the end of TextElement but not on empty line
// - caret at the end of TextElement on own empty line
extension UIASVMC_escape_Tests {    
    
    func test_that_if_the_TextElement_is_empty_it_works_and_does_not_move() {
        let textInAXFocusedElement = ""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))        
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 0)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_but_not_on_an_empty_line_it_goes_back_one_character() {
        let textInAXFocusedElement = """
   caret is
gonna be at the end
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)     
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))        
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
   caret is
gonna be at the end
"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 30)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_it_works_and_does_nothing() {
        let textInAXFocusedElement = """
caret is on its
own empty
    line

"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))                
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.value, """
caret is on its
own empty
    line

"""
        )
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
    }
    
}


// TextFields
extension UIASVMC_escape_Tests {
    
    func test_that_the_caret_location_goes_to_the_head() {
        let textInAXFocusedElement = "some plain simple text for once"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))        
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 23)
    }
    
}


// TextViews
extension UIASVMC_escape_Tests {
    
    func test_that_the_caret_location_goes_to_the_head_even_when_the_selection_spans_over_multiple_lines() {
        let textInAXFocusedElement = """
let's try with selecting
over multiple lines
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))        
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 28)
    }
    
    func test_that_if_the_head_is_above_line_end_limit_then_the_caret_goes_to_the_end_limit() {
        let textInAXFocusedElement = """
so this is definitely
gonna go after
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        VimEngine.shared.enterNormalMode()
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        // can be replaced by other moves, or even $ when fixed, later
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.caretLocation, 35)
    }    
    
}
