@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_daw_Tests: FailingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


extension FailingASNM_daw_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
