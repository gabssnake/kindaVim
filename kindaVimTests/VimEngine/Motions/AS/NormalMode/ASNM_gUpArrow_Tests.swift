@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_gUpArrow_Tests: ASNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .upArrow))
    }

}


extension SucceedingASNM_gUpArrow_Tests {
    
    func test_that_if_we_are_on_something_different_than_a_TextArea_it_does_not_use_the_AS_but_uses_the_KS_instead() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingComboBoxMock()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "")
        XCTAssertEqual(ksNormalModeMock.functionCalled, "gk(times:)")
    }

    func test_that_if_we_are_on_a_TextArea_it_calls_the_correct_function_on_accessibility_strategy() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asNormalModeMock.functionCalled, "gk(times:on:)")
    }

    func test_that_it_keeps_Vim_in_NormalMode() {
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }

}
