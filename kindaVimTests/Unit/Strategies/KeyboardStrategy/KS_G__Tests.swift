@testable import kindaVim
import XCTest

class KS_G__Tests: KS_BaseTests {
    
    func test_that_G_is_getting_transformed_to_command_down() {
        let transformedKeys = keyboardStrategy.G()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .down)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .both)
    }
    
}
