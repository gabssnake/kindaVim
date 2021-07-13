@testable import kindaVim
import XCTest

class UsingKS___Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .underscore))
    }

}

extension UsingKS___Tests {
    
    func test_that___calls_the_underscore_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "underscore()")
    }
    
    func test_that___keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}




