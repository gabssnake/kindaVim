@testable import kindaVim
import XCTest

class UsingKS_BaseTests: XCTestCase {

    let keyboardStrategyMock = KeyboardStrategyMock()

    override func setUp() {
        VimEngine.shared.keyboardStrategy = keyboardStrategyMock
        VimEngine.shared.asNormalMode = FailingAccessibilityStrategyNormalModeStub()
        VimEngine.shared.enterNormalMode()
    }

}
