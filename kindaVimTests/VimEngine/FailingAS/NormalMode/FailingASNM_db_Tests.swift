@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_db_Tests: FailingAS_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .b))
    }
    
}


extension FailingASNM_db_Tests {
    
    func test_that_it_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "dbForTextElement()")
    }
    
    func test_that_it_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "dbForNonTextElement()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
