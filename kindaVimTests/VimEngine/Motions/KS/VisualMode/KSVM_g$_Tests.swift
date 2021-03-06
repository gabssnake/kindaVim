@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_g$_Tests: KSVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
    }

}


// VisualStyle Characterwise
extension KSVM_g$_Tests {

    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "gDollarSign(_:)")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
