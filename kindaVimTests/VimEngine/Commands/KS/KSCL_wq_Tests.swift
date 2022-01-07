@testable import kindaVim
import KeyCombination
import XCTest


class KSCL_wq_Tests: KSCL_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .colon))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .w))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .q))
        // TODO: remove keyMapping here, make the KSCL AS fail?
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .return), appMode: .keyMapping)
    }

}


extension KSCL_wq_Tests {
    
    func test_that_it_calles_the_correct_command() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(commandsMock.functionCalled, "wq()")
    }
    
    func test_that_it_switches_Vim_to_InsertMode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
