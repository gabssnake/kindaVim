@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_daw_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


extension SucceedingASNM_daw_Tests {
    
    func test_that_it_calls_the_correct_function_on_AS() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "daw(on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
