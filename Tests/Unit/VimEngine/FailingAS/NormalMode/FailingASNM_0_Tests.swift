@testable import kindaVim
import XCTest


class FailingASNM_0_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .zero))
    }
    
}


extension FailingASNM_0_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "zero()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
