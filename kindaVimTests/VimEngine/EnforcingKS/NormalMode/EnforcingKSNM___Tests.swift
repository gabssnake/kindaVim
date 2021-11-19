@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS___Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .underscore), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS___Tests {
    
    func test_that___calls_the_underscore_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "underscore()")
    }
    
    func test_that___keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
