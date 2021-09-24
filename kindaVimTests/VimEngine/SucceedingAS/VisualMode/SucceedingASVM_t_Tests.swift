@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_t_Tests: SucceedingASVM_BaseTests {
    
    private func applyMove() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .t))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .z))
    }
    
}


// visualStyle character
extension SucceedingASVM_t_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "tForVisualStyleCharacterwise(to:on:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM_t_Tests {
    
    func test_that_it_does_nothing_because_the_move_does_not_make_sense_on_ASVM_when_visualStyle_is_linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
    }
    
}


// both
extension SucceedingASVM_t_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyMove()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
