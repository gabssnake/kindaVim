@testable import kindaVim
import XCTest

class UsingAS_l_Tests: UsingAS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
    }

}

extension UsingAS_l_Tests {
    
    func test_that_l_calls_the_l_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "l(on:)")
    }
    
    func test_that_l_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}
