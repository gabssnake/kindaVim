@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_c_Tests: FailingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
    }
    
}


extension FailingASVM_c_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_switches_Vim_into_InsertMode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}
