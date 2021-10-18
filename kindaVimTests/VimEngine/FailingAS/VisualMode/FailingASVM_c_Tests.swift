@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_c_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
    }

}


// VisualStyle Characterwise
extension FailingASVM_c_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "c()")
    }

}


extension FailingASVM_c_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "c()")
    }

}


// Both
extension FailingASVM_c_Tests {
    
    func test_that_it_switches_Vim_into_InsertMode() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
   
}
