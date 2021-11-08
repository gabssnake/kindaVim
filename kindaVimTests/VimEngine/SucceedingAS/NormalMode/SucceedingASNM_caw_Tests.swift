@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_caw_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


// see ci" for blah blah on why no test about Vim mode here but in UI
extension SucceedingASNM_caw_Tests {
    
    func test_that_it_calls_the_correct_function_on_AS() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "caw(on:)")
    }
    
}
