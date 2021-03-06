@testable import kindaVim
import KeyCombination
import XCTest


class KS_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()

    let ksNormalModeMock = KeyboardStrategyNormalModeMock()
    let ksVisualModeMock = KeyboardStrategyVisualModeMock()

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.ksNormalMode = ksNormalModeMock
        kindaVimEngine.ksVisualMode = ksVisualModeMock
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategyFailingMock()
        kindaVimEngine.asNormalMode = AccessibilityStrategyNormalModeMock()
        kindaVimEngine.asVisualMode = AccessibilityStrategyVisualModeMock()
    }

}
