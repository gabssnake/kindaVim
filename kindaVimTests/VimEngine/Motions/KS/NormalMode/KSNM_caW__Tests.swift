@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_caW__Tests: KSNM_BaseTests {

    override func setUp() {
        super.setUp()

        // TODO: remove all the keyMapping
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .W))
    }

}


extension KSNM_caW__Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_this_move_is_not_doable_with_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
