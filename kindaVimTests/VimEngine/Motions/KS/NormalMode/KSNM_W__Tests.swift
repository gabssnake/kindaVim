@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_W__Tests: KSNM_BaseTests {

    override func setUp() {
super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .W))
    }

}


extension KSNM_W__Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_this_move_is_not_doable_with_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
