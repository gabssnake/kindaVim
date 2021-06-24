@testable import kindaVim
import XCTest

class UsingASNM_I__Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i, shift: true))
    }
    
}

extension UsingASNM_I__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "I(on:)")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
}
