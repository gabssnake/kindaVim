import XCTest

class NonTextElementsTests: AEA_BaseTests {}

// from AXUIElement to AccessibilityTextElement
extension NonTextElementsTests {

    func test_that_trying_to_convert_an_AXUIElement_button_to_an_AccessibilityTextElement_returns_nil() {
        app.buttons.firstMatch.tap()

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertNil(accessibilityElement)
    }

}

// from AccessibilityTextElement to AXUIElement
extension NonTextElementsTests {

    func test_that_trying_to_convert_an_AccessibilityTextElement_to_an_AXUIElement_button_returns_false() {
        let accessibilityElement = AccessibilityTextElement(
            internalText: "hi i'm a button",
            caretLocation: 5,
            lineStart: 0
        )

        app.buttons.firstMatch.tap()

        let conversionSucceeded = AccessibilityTextElementAdaptor.toAXFocusedElememt(from: accessibilityElement)

        XCTAssertFalse(conversionSucceeded)
    }

}
