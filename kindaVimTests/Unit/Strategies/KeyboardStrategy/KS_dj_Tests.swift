@testable import kindaVim
import XCTest

class KS_dj_Tests: KS_BaseTests {

    func test_that_dj_returns_a_big_pile_of_key_combinations() {
        let keyCombinations = keyboardStrategy.dj()

        guard keyCombinations.count == 6 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .a, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .down, shift: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .down, shift: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .delete))
        XCTAssertEqual(keyCombinations[4], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[5], KeyCombination(key: .left, command: true))

    }

}
