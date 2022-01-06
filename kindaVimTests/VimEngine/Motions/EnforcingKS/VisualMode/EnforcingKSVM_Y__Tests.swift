@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingASVM_Y__Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .Y), appMode: .keyMapping)
    }

}


extension EnforcingASVM_Y__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "YForTextElement()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_NonTextElements_as_a_fallback() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "YForNonTextElement()")
    }
    
    func test_that_it_switches_Vim_to_NormalMode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_sets_the_LastYankStyle_to_Linewise() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.state.lastYankStyle, .linewise)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
