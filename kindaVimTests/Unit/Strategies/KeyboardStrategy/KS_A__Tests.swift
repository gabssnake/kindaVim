@testable import kindaVim
import XCTest

class KS_A__Tests: KS_BaseTests {
    
    func test_that_A_gets_transformed_to_command_right() {
        let transformedKeys = keyboardStrategy.A()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .e, control: true))
    }
    
}
