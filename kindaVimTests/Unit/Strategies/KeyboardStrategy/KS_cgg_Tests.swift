@testable import kindaVim
import XCTest

class KS_cgg_Tests: KS_BaseTests {

    func test_that_cgg_returns_control_e_shift_command_up_delete() {
        let keyCombinations = keyboardStrategy.cgg()

        guard keyCombinations.count == 3 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .e, control: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .up, shift: true, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .delete))
    }

}
