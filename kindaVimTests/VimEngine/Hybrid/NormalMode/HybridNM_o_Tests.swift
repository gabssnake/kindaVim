@testable import kindaVim
import KeyCombination
import XCTest
import SwiftUI


class Hybrid_o_Tests: Hybrid_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .hybrid)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .o), appMode: .hybrid)
    }
    
}


extension Hybrid_o_Tests {
    
    func test_that_it_does_not_call_the_AS_but_calls_KS_instead() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "")
        XCTAssertEqual(ksNormalModeMock.functionCalled, "o")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
