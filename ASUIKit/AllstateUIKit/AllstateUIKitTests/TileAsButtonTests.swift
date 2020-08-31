//
//  TileAsButtonTests.swift
//  AllstateUIKitTests
//
//  Created by Murthy, Ajith (INFOSYS) on 19/12/19.
//  Copyright © 2019 Allstate. All rights reserved.
//

import XCTest
@testable import AllstateUIKit
class TileAsButtonTests: XCTestCase {
    var tileData: TileData?
    var tileButton = TileAsButton()
    var promoTileButton = PromoTileAsButton()
    var tileBuilder = TileBuilder()
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        tileData = TileData(tileID: "1", image: UIImage(named: ""),
                              messages: ["Digital\nLocker", "Sample text"])
    }

    override func tearDown() {
         super.tearDown()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
         tileData = nil
         if testRun!.failureCount > 0 {
                print("failed")
            } else {
                print("success")
            }
         print(testRun!.failureCount)
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    func testConfigure() {
        XCTAssertNotNil(tileBuilder.createTileButton(with: tileData!, type: .quickAccess))
        XCTAssertNotNil(tileBuilder.createTileButton(with: tileData!, type: .agent))
        XCTAssertNotNil(tileBuilder.createTileButton(with: tileData!, type: .idCard))
        XCTAssertNotNil(tileBuilder.createTileButton(with: tileData!, type: .promo))
        XCTAssertNotNil(tileButton.configureQuickAccessTile(with: tileData!))
        XCTAssertNotNil(tileButton.configureAgentTile(with: tileData!))
        XCTAssertNotNil(tileButton.configureIdCardTile(with: tileData!))
        XCTAssertNotNil(promoTileButton.configurePromoTile(with: tileData!))
        XCTAssertNotNil(promoTileButton.reloadTile(with: tileData!))
        XCTAssertNotNil(promoTileButton.setupHighlightedState)
        XCTAssertNotNil(tileButton.intrinsicContentSize)
        XCTAssertNotNil(tileButton.layoutSubviews)
        XCTAssertNotNil(tileButton.tileStyle)
    }
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
