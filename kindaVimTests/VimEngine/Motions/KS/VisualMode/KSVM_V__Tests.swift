@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_V__Tests: KSVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
    }
    
}


// Entering from Normal Mode
extension KSVM_V__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_Normal_Mode() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForTextElementWhenEnteringFromNormalMode()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_NonTextElements_as_a_fallback_when_in_Normal_Mode() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForNonTextElement()")
    }
    
    func test_that_if_Vim_was_in_NormalMode_it_switches_into_VisualMode_Linewise() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.state.visualModeStyle, .linewise)
    }
    
    func test_that_it_resets_the_count_when_entering_from_NormalMode() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// VisualStyle Characterwise
extension KSVM_V__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {        
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForTextElementWhenInVisualStyleCharacterwise()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_NonTextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForNonTextElement()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Characterwise_it_switches_into_VisualMode_Linewise() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.state.visualModeStyle, .linewise)
    }
    
    func test_that_it_resets_the_count_if_Vim_was_in_VisualStyle_Characterwise() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// VisualStyle Linewise
extension KSVM_V__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Linewise() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        kindaVimEngine.state.visualModeStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForTextElementWhenInVisualStyleLinewise()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        kindaVimEngine.state.visualModeStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForNonTextElement()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_NormalMode() {
        kindaVimEngine.state.visualModeStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count_if_Vim_was_in_VisualStyle_Linewise() {
        kindaVimEngine.state.visualModeStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
