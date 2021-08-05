@testable import kindaVim
import XCTest

class KS_0_Tests: KSUT_NM_BaseTests {
    
    func test_that_0_returns_command_left_command_left() {
        let keyCombinations = ksNormalMode.zero()

        guard keyCombinations.count == 2 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .left, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .left, command: true))
    }
    
}

