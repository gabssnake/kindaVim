@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_e_Tests: FailingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .e))
    }
    
}


extension FailingASVM_e_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }
    
}
