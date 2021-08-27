@testable import kindaVim
import XCTest


class SucceedingASNM_yiw_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


extension SucceedingASNM_yiw_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "yiw(on:)")
    }
    
    func test_that_l_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
    func test_that_it_sets_the_last_yank_style_to_characterwise() {
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .characterwise)
    }

}
