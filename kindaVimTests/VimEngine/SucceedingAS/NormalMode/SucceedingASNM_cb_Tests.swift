@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_cb_Tests: SucceedingASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested(pgR: Bool = false) {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .b), appMode: pgR == true ? .pgR : .auto)
    }
    
}


extension SucceedingASNM_cb_Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asNormalModeMock.functionCalled, "cb(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on() {
        applyKeyCombinationsBeingTested(pgR: true)
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "cb(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
 
}
