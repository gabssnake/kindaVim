@testable import kindaVim
import KeyCombination
import XCTest


class FailingAS_BaseTests: XCTestCase {
    
    let kindaVimEngine = KindaVimEngine()
    
    let ksNormalModeMock = KeyboardStrategyNormalModeMock()
    let ksVisualModeMock = KeyboardStrategyVisualModeMock()
    
    override func setUp() {
        kindaVimEngine.ksNormalMode = ksNormalModeMock
        kindaVimEngine.ksVisualMode = ksVisualModeMock
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategyFailingMock()
        kindaVimEngine.asNormalMode = AccessibilityStrategyNormalModeMock()
        kindaVimEngine.asVisualMode = AccessibilityStrategyVisualModeMock()
        kindaVimEngine.enterNormalMode()        
        
        ksNormalModeMock.functionCalled = ""
        ksVisualModeMock.functionCalled = ""
    }
    
}
