@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_G__Tests: FailingASVM_BaseTests {
    
    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .G))
    }
    
}


// VisualStyle Characterwise
extension FailingASVM_G__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMoveBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "GForVisualStyleCharacterwise()")
    }

}


// VisualStyle Linewise
extension FailingASVM_G__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMoveBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "GForVisualStyleLinewise()")
    }
}


// Both
extension FailingASVM_G__Tests {

    func test_that_it_keeps_Vim_in_visual_mode() {
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
}

