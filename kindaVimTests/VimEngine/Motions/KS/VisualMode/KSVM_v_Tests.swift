@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_v_Tests: KSVM_BaseTests {
    
    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .v))
    }
    
}


// Entering from Normal Mode
extension KSVM_v_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_Normal_Mode() {
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForTextElementWhenEnteringFromNormalMode()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_NonTextElements_as_a_fallback_when_in_Normal_Mode() {
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForNonTextElement()")
    }
    
    func test_that_it_resets_the_count_when_entering_from_NormalMode() {
        kindaVimEngine.enterNormalMode()
        
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// VisualStyle Characterwise
extension KSVM_v_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {        
        
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForTextElementWhenInVisualStyleCharacterwise()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_NonTextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {
        
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForNonTextElement()")
    }
    
    func test_that_it_resets_the_count_if_Vim_was_in_VisualStyle_Characterwise() {
        kindaVimEngine.state.visualStyle = .characterwise
        
        
        XCTAssertNil(kindaVimEngine.count)
    }
        
}


// VisualStyle Linewise
extension KSVM_v_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Linewise() {
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForTextElementWhenInVisualStyleLinewise()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForNonTextElement()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_VisualStyle_Characterwise() {
        kindaVimEngine.state.visualStyle = .linewise
        
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.state.visualStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count_if_Vim_was_in_VisualStyle_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
