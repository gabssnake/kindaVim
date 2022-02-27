@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_return_Tests: ASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .return))
    }
    
}


extension SucceedingASVM_return_Tests {
    
    func test_that_if_we_are_on_something_different_than_a_TextArea_it_does_not_use_the_AS_but_uses_the_KS_instead() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextFieldMock()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
        XCTAssertEqual(ksVisualModeMock.functionCalled, "return(times:_:)")
    }
    
    func test_that_on_a_TextArea_it_uses_AS() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "return(on:_:)")
    }

}


// both
extension SucceedingASVM_return_Tests {
    
    // see ASNM for blah blah
    func test_that_it_keeps_Vim_in_VisualMode() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
