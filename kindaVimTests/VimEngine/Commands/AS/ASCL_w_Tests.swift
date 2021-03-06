@testable import kindaVim
import KeyCombination
import XCTest


class ASCL_w_Tests: ASCL_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .colon))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .w))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .return))
    }

}


extension ASCL_w_Tests {
    
    func test_that_it_calles_the_correct_command() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(commandsMock.functionCalled, "colonw()")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
