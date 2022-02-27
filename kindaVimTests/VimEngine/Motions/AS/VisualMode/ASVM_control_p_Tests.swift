@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_control_p_Tests: ASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .controlP))
    }
    
}


extension SucceedingASVM_control_p_Tests {    
    
    
    func test_that_if_we_are_on_something_different_than_a_TextArea_it_does_not_use_the_AS_but_uses_the_KS_instead() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingComboBoxMock()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
        XCTAssertEqual(ksVisualModeMock.functionCalled, "k(times:_:)")
    }
    
    func test_that_if_we_are_on_a_TextArea_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asVisualModeMock.functionCalled, "k(on:_:)")
    }
       
    func test_that_it_keeps_Vim_in_VisualMode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }     
        
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
