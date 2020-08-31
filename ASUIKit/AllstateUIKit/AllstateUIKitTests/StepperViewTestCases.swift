//
//  StepperViewTestCases.swift
//  AllstateUIKitTests
//
//  Created by Reddy, Sushma (Technosoft) on 19/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import XCTest
@testable import AllstateUIKit

class StepperViewTestCases: XCTestCase {

    var viewMirror: ViewMirror!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitWithFrame_withFrame_shouldReturnViewsFromNib() {
        //Arrange
        let stepperView = StepperView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))

        //Act
        viewMirror = ViewMirror(view: stepperView)

        //Assert
        XCTAssertNotNil(viewMirror.titleLabel, "Should contain UILabel as title")
        XCTAssertNotNil(viewMirror.collectionview, "Should contain UICollectionView to display steps")
        XCTAssertNotNil(viewMirror.contentView, "Should contain content view")
    }

    func testInit_withXib_shouldReturnViewsFromNib() {
        //Arrange
        let stepperView = StepperView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        viewMirror = ViewMirror(view: stepperView)

        //Assert
        XCTAssertNotNil(viewMirror.titleLabel, "Should contain UILabel as title")
        XCTAssertNotNil(viewMirror.collectionview, "Should contain UICollectionView to display steps")
        XCTAssertNotNil(viewMirror.contentView, "Should contain content view")
    }

    func testInit_withInitialSetup_shouldReturnDefaultConfiguration() {
        //Arrange
        let stepperView = StepperView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        viewMirror = ViewMirror(view: stepperView)

        //Assert
        XCTAssertEqual(viewMirror.titleLabel?.text, "", "Should return empty text")
        XCTAssertEqual(viewMirror.titleLabel?.textColor, UIColor.primaryDeepBlue, "Should return text color grey3")
        XCTAssertEqual(viewMirror.titleLabel?.font, ASTheme.font.textRegular17, "Should return font body")
        XCTAssertEqual(viewMirror.collectionview?.numberOfSections, 1, "Should return 1 section")
        let stepsCount = viewMirror.collectionview?.numberOfItems(inSection: 0)
        XCTAssertEqual(stepsCount, 0, "Should return 1 section with 0 items")
    }

    func testConfigure_withTestData_shouldReturn5Steps() {
        //Arrange
        let stepperView = StepperView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 80))
        viewMirror = ViewMirror(view: stepperView)

        //Act
        stepperView.configure(totalSteps: 5, currentStepNumber: 1, title: "Step 1 of 5")

        //Assert
        XCTAssertEqual(stepperView.totalSteps,
                       5,
                       "Should return count 5")
        XCTAssertEqual(viewMirror.collectionview?.numberOfItems(inSection: 0),
                       5,
                       "Should return count 5")
        XCTAssertEqual(stepperView.currentStepNumber,
                       1,
                       "Should return 1")
        XCTAssertEqual(viewMirror.titleLabel?.text,
                       "Step 1 of 5",
                       "Should return Step 1 of 5")
    }
}

extension ViewMirror {
    var titleLabel: UILabel? { extract() }
    var collectionview: UICollectionView? { extract() }
    var contentView: UIView? { extract() }
}
