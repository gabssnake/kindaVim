@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_yt_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.lastYankStyle = .linewise
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .t))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .X))
    }
    
}


extension SucceedingASNM_yt_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "yt(times:to:on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_sets_the_last_yank_style_to_characterwise() {
        XCTAssertEqual(kindaVimEngine.lastYankStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
