@testable import kindaVim
import XCTest


class UsingASVM_escape_Tests: UsingASVM_BaseTests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy_visual_mode() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "escape(on:)")
    }
    
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_switches_into_normal_mode() {
        VimEngine.shared.visualStyle = .characterwise
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_normal_mode() {
        VimEngine.shared.visualStyle = .linewise
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
