@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_g$_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .dollarSign), appMode: .keyMapping)
    }

}


extension EnforcingKS_g$_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "gDollarSign()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
