@testable import kindaVim
import KeyCombination
import XCTest
import Common


// see ? for blah blah
class SucceedingASNM_slash_Return_Tests: ASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }
    
}


extension SucceedingASNM_slash_Return_Tests {

    func test_that_if_there_is_no_lastSearchCommand_it_does_not_call_the_AS_move() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.lastSearchCommand)
        XCTAssertEqual(asNormalModeMock.functionCalled, "")
    }
    
    func test_that_if_there_is_a_lastSearchCommand_then_it_sets_the_new_lastSearchCommand_correctly() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .o))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        XCTAssertEqual(kindaVimEngine.lastSearchCommand, LastSearchCommand(motion: .interrogationMark, searchString: "go"))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand, LastSearchCommand(motion: .slash, searchString: "go"))
    }
        

        
    func test_that_if_there_is_a_lastSearchCommand_it_calls_the_correct_function_with_the_lastSearchCommand_searchString() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .h))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .e))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asNormalModeMock.functionCalled, "slash(times:to:on:)")
        XCTAssertEqual(asNormalModeMock.lastSearchCommandParameter, LastSearchCommand(motion: .slash, searchString: "hel"))
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
