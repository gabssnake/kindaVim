@testable import kindaVim
import KeyCombination
import XCTest


class KSUT_VM_j_Tests: KSUT_BaseTests {
    
    func test_that_j_returns_shift_down() {
        let keyCombinations = ksVisualMode.j()

        guard keyCombinations.count == 1 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down, shift: true))
    }
    
}
