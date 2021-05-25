@testable import kindaVim
import XCTest

class KS_G__Tests: KS_BaseTests {
    
    func test_that_G_returns_command_down() {
        let keyCombinations = keyboardStrategy.G()

        guard keyCombinations.count == 4 else { return XCTFail() }
        XCTAssertEqual(keyCombinations[0], KeyCombination(key: .down, command: true))
        XCTAssertEqual(keyCombinations[1], KeyCombination(key: .right, command: true))
        XCTAssertEqual(keyCombinations[2], KeyCombination(key: .left, option: true))
        XCTAssertEqual(keyCombinations[3], KeyCombination(key: .down))
    }
    
}
