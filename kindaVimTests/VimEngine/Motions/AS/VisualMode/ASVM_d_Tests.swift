@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_d_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
    }
    
}


extension SucceedingASVM_d_Tests {    
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "d(on:_:)")
    }
    
    func test_that_it_switches_Vim_to_NormalMode() {
        XCTAssertEqual(kindaVimEngine.state.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
