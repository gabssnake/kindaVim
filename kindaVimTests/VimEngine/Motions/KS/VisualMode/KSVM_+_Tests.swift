@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_plus_Tests: KSVM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .plus))
    }

}


// see KSNM for blah blah
extension KSVM_plus_Tests {
    
    func test_that_if_KS_return_set_the_lastMoveBipped_to_true_then_it_goes_to_InsertMode() {
        kindaVimEngine.state.lastMoveBipped = true
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
        
    func test_that_if_KS_return_set_the_lastMoveBipped_to_false_then_it_stays_in_VisualMode() {
        kindaVimEngine.state.lastMoveBipped = false
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
}


extension KSVM_plus_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(ksVisualModeMock.functionCalled, "return(times:_:)")
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
