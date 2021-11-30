@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_a_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_a_Tests {
    
    func test_that_a_calls_the_a_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "a()")
    }
    
    func test_that_a_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
