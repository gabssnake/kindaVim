@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_cT__Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .T))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
    }
    
}


// this is like ci". sometimes we will go back to edit mode, sometimes
// we will stay in normal mode, so the tests have to be done
// in UI Tests
extension SucceedingASNM_cT__Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "cT(to:on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on() {
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .T))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a), appMode: .pgR)
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "cT(to:on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
