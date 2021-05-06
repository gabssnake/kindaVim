@testable import kindaVim
import XCTest

class KS_k_Tests: KS_BaseTests {
    
    func test_that_k_is_getting_transformed_to_up() {
        let transformedKeys = keyboardStrategy.k()

        guard transformedKeys.count == 1 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0], KeyCombination(key: .up))
    }
    
}
