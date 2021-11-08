@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_gj_Tests: SucceedingASVM_BaseTests {
    
    private func applyMove() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .j))
    }
    
}


// visualStyle character
extension SucceedingASVM_gj_Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "gjForVisualStyleCharacterwise(on:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM_gj_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "gjForVisualStyleLinewise(on:)")
    }
    
}


// both
extension SucceedingASVM_gj_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyMove()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
}
