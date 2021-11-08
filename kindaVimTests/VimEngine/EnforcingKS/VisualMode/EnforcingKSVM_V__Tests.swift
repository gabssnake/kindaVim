@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_V__Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V), enforceKeyboardStrategy: true)
    }
    
}


// Entering from Normal Mode
extension EnforcingKSVM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_entering_from_NormalMode() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForEnteringFromNormalMode()")
    }
    
    func test_that_if_Vim_was_in_NormalMode_it_switches_into_VisualMode_Linewise() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .linewise)
    }
    
}


// VisualStyle Characterwise
extension EnforcingKSVM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForVisualStyleCharacterwise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Characterwise_it_switches_into_VisualMode_Linewise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .linewise)
    }
        
}


// VisualStyle Linewise
extension EnforcingKSVM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForVisualStyleLinewise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_NormalMode() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
