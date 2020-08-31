//
//  multiple.swift
//  LSUIKitTests
//
//  Created by Chapagain, Deepak (INFOSYS) on 8/9/20.
//  Copyright © 2020 Chapagain, Deepak. All rights reserved.
//

import XCTest
@testable import LSUIKit

class multiple: XCTestCase {
    var multiply: Multiply!

    override func setUp() {
        multiply = Multiply()
    }

    func testExample() {
        let x = 3
        let y = 3
        let result = multiply.multiple(valueX: x, with: y)
        XCTAssertEqual(result, 9)  
    }
}
