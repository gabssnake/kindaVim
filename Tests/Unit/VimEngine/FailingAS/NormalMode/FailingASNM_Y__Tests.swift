@testable import kindaVim
import XCTest


class FailingASNM_Y_Tests: FailingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.lastYankStyle = .characterwise
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .Y))
    }
    
}


extension FailingASNM_Y_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "yy()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
    func test_that_it_sets_the_last_yank_style_to_linewise() {
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .linewise)
    }
    
}
