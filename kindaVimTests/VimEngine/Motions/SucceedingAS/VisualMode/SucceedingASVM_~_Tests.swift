@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_tilde_Tests: SucceedingASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested(appMode: AppMode = .auto) {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .tilde), appMode: appMode)
    }
    
}


extension SucceedingASVM_tilde_Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asVisualModeMock.functionCalled, "tilde(on:pgR:)")
        XCTAssertEqual(asVisualModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on() {
        applyKeyCombinationsBeingTested(appMode: .pgR)
                
        XCTAssertEqual(asVisualModeMock.functionCalled, "tilde(on:pgR:)")
        XCTAssertEqual(asVisualModeMock.pgRPassed, true)
    }
    
    func test_that_it_switches_Vim_into_NormalMode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }

}
