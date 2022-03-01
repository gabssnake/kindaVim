@testable import kindaVim
import KeyCombination
import XCTest
import SwiftUI


class SucceedingASNM___Tests: ASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .two))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .underscore))
    }
    
}


extension SucceedingASNM___Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "underscore(times:on:)")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}

