import XCTest


// bug in Big Sur and Monterey where the character right after
// the start of a line, if selected through mouse or AX (but not keyboard),
// will return data from the previous line.
// reported as FB9114768 but as usual, i should just put it up my asshole
class BigSurBugTests: ATEA_BaseTests {
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_from_the_character_right_after_the_start_of_a_line() {
        let textInAXFocusedElement = """
some fucking
shit
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.shift])
        
        // the bug happens only when setting the selection through mouse or AX
        // which is why we have to grab the element, push it back to AX to make it fail
        // and grabbing it again for testing
        var accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: accessibilityElement!)
        accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textArea)
        XCTAssertEqual(accessibilityElement?.value, """
some fucking
shit
"""
        )
        XCTAssertEqual(accessibilityElement?.length, 17)
        XCTAssertEqual(accessibilityElement?.caretLocation, 13)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.value, "shit")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 2)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 13)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 17)
    }
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_from_the_character_right_before_the_start_of_a_line() {
        let textInAXFocusedElement = """
some fucking
shit
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.shift])
        
        var accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: accessibilityElement!)
        accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textArea)
        XCTAssertEqual(accessibilityElement?.value, """
some fucking
shit
"""
        )
        XCTAssertEqual(accessibilityElement?.length, 17)
        XCTAssertEqual(accessibilityElement?.caretLocation, 12)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.value, "some fucking\n")
        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 0)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 13)
    }
    
}


