@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_ciSingleQuote_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .singleQuote))
    }
    
}


extension SucceedingASNM_ciSingleQuote_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciSingleQuote(on:)")
    }
    
}
