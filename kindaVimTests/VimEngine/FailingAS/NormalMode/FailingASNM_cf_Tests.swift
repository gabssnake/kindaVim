@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_cf_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .f))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .k))
    }
    
}


extension FailingASNM_cf_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
