//
//  AS_l_Tests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 06/05/2021.
//

@testable import kindaVim
import XCTest

class AS_l_Tests: XCTestCase {

    let accessibilityStrategy = AccessibilityStrategy()

}

extension AS_l_Tests {
    
    func test_that_l_is_moving_cursor_position_to_the_right_by_one_increment() {
        let element = AccessibilityElement(
            text: "hello world",
            cursorLocation: 6,
            selectionLength: 0
        )
        
        let returnedElement = accessibilityStrategy.l(on: element)
        
        XCTAssertEqual(returnedElement?.text, element.text)
        XCTAssertEqual(returnedElement?.cursorLocation, 7)
        XCTAssertEqual(returnedElement?.selectionLength, element.selectionLength)
    }
    
}
    
