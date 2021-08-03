@testable import kindaVim
import XCTest

class KS_control_d_Tests: KS_BaseTests {
    
    func test_that_control_d_returns_fn_down() {
        let keyCombinations = ksNormalMode.controlD()
        
        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .fnDown))
    }
    
}


