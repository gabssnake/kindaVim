@testable import kindaVim
import XCTest


class SucceedingASVM_l_Tests: SucceedingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
    }
    
}


extension SucceedingASVM_l_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy_visual_mode() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "l(on:)")
    }
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
