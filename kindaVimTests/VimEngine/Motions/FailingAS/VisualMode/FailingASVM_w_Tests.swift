@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_w_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


// VisualStyle Characterwise
extension FailingASVM_w_Tests {
    
    func test_that_it_calls_the_correct_function_for_NonTextElements_on_KS_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "wForNonTextElementWhenInVisualStyleCharacterwise()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "wForTextElementWhenInVisualStyleCharacterwise()")
    }
    
    func test_that_it_keeps_Vim_in_visual_mode_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_resets_the_count_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}


// VisualStyle Linewise
extension FailingASVM_w_Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_this_move_does_not_exist_for_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_visual_mode_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_resets_the_count_when_VisualStyle_is_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}