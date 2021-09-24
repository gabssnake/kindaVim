@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_ciRightBracket_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .rightBracket))
    }
    
}


// see ci" for blah blah
extension SucceedingASNM_ciRightBracket_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciRightBracket(on:)")
    }
    
}
