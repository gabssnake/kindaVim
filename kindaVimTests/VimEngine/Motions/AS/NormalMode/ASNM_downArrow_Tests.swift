@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_downArrow_Tests: ASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .downArrow))
    }
    
}


extension SucceedingASNM_downArrow_Tests {
    
    func test_that_if_we_are_on_something_different_than_a_TextArea_it_does_not_use_the_AS_but_uses_the_KS_instead() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextFieldMock()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "")
        XCTAssertEqual(ksNormalModeMock.functionCalled, "j(times:)")
    }
    
    func test_that_on_a_TextArea_if_it_is_not_remap_it_calls_j_on_AS() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        kindaVimEngine.jkMapping = false
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "j(times:on:)")
    }
        
    func test_that_on_a_TextArea_if_it_is_remapped_it_calls_gj_on_AS() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        kindaVimEngine.jkMapping = true
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "gj(times:on:)")
    }

}


// both
extension SucceedingASNM_downArrow_Tests {
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
