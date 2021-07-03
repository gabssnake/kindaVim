import XCTest


class UIAS_BaseTests: XCTestCase {

    var app: XCUIApplication!
    let asNormalMode = AccessibilityStrategyNormalMode()
    let asVisualMode = AccessibilityStrategyVisualMode()

    override func setUpWithError() throws {
        continueAfterFailure = false

        app = XCUIApplication()
        app.launch()
        
        VimEngine.shared.enterNormalMode()
    }
    
    func applyMoveAndGetBackAccessibilityElement(_ move: (AccessibilityTextElement?) -> AccessibilityTextElement?) -> AccessibilityTextElement? {
        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        guard let transformedElement = move(accessibilityElement) else { return nil }
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: transformedElement)
        
        return  AccessibilityTextElementAdaptor.fromAXFocusedElement()        
    }

}
