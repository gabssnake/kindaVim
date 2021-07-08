@testable import kindaVim
import XCTest


// the Y move is just an alias to yy. so it just calls yy
class UsingASNM_Y__Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .Y))
    }
    
}


extension UsingASNM_Y__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "yy(on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
    func test_that_it_sets_the_last_yank_style_to_linewise() {
        XCTAssertEqual(VimEngine.shared.lastYankStyle, .linewise)
    }
    
}
