@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_caw_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


// see ci" for blah blah on why no test about Vim mode here but in UI
extension SucceedingASNM_caw_Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "caw(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on() {
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w), appMode: .pgR)
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "caw(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
