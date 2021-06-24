@testable import kindaVim
import XCTest


class UsingASNM_V__Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
    }
    
}


extension UsingASNM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "V(on:)")
    }
    
    func test_that_it_switches_Vim_to_visual_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .visual)
    }
    
    func test_that_it_sets_the_visual_style_to_linewise() {
        XCTAssertEqual(VimEngine.shared.visualStyle, .linewise)
    }
        
}
