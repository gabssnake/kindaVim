@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_caret_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .caret))
    }
    
}


extension SucceedingASVM_caret_Tests {    
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "caret(on:_:)")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode() {
        XCTAssertEqual(kindaVimEngine.state.currentMode, .visual)
    }     
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
