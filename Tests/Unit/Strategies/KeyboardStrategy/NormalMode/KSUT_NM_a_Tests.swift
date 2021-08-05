@testable import kindaVim
import XCTest

class KS_a_Tests: KSUT_NM_BaseTests {
    
    func test_that_a_returns_right() {
        let keyCombinations = ksNormalMode.a()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .right))
    }

}
