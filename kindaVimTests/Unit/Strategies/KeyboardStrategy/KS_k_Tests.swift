@testable import kindaVim
import XCTest

class KS_k_Tests: KS_BaseTests {
    
    func test_that_k_returns_up() {
        let keyCombinations = keyboardStrategy.k()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .up))
    }
    
}
