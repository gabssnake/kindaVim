//
//  KeyboardStrategyTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 02/05/2021.
//

@testable import kindaVim
import XCTest

class KSMotionsTests: XCTestCase {
    
    func test_that_h_is_getting_transformed_to_left() {
        let transformedKeys = VimEngineController.shared.keyboardStrategy.h()
        
        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_j_is_getting_transformed_to_down() {
        let transformedKeys = VimEngineController.shared.keyboardStrategy.j()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .down)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .down)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_k_is_getting_transformed_to_up() {
        let transformedKeys = VimEngineController.shared.keyboardStrategy.k()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .up)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .up)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }

    func test_that_l_is_getting_transformed_to_right() {
        let transformedKeys = VimEngineController.shared.keyboardStrategy.l()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .right)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .right)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_b_is_getting_transformed_to_alt_left() {
        let transformedKeys = VimEngineController.shared.keyboardStrategy.b()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .left)
        XCTAssertEqual(transformedKeys[0].option, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .left)
        XCTAssertEqual(transformedKeys[1].option, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }
    
    func test_that_G_is_getting_transformed_to_command_down() {
        let transformedKeys = VimEngineController.shared.keyboardStrategy.G()

        guard transformedKeys.count == 2 else { return XCTFail() }
        XCTAssertEqual(transformedKeys[0].key, .down)
        XCTAssertEqual(transformedKeys[0].command, true)
        XCTAssertEqual(transformedKeys[0].action, .press)
        XCTAssertEqual(transformedKeys[1].key, .down)
        XCTAssertEqual(transformedKeys[1].command, true)
        XCTAssertEqual(transformedKeys[1].action, .release)
    }

}
