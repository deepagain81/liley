//
//  CardsPriorityTests.swift
//  AllstateUIKitTests
//
//  Created by Attal, Hemanth (INFOSYS) on 12/19/19.
//  Copyright © 2019 Allstate. All rights reserved.
//

import XCTest
@testable import AllstateUIKit

class CardsPriorityTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testCardsPriority_TopSection() {
        let topSection = CardsPriorityHeaderSection(titleLine1: "Source/Subheadline",
                                                 titleLine2: "SOURCE/FOOTNOTE",
                                                 titleLine3Left: "SOURCE/FOOTNOTE",
                                                 titleLine3Right: "SOURCE/FOOTNOTE")
        let view =  CardsPriority()
        view.headerSectionTitle1.text = topSection.titleLine1
        view.headerSectionTitle2.text = topSection.titleLine2
        view.headerSectionTitle3Left.text = topSection.titleLine3Left
        view.headerSectionTitle3Right.text = topSection.titleLine3Right
        XCTAssertEqual(view.headerSectionTitle1.text, topSection.titleLine1)
        XCTAssertEqual(view.headerSectionTitle2.text, topSection.titleLine2)
        XCTAssertEqual(view.headerSectionTitle3Left.text, topSection.titleLine3Left)
        XCTAssertEqual(view.headerSectionTitle3Right.text, topSection.titleLine3Right)
    }

    func testCardsPriority_MiddleSection() {
        let middeleSection  = CardsPriorityContentSection(titleLine1: "Lens Title",
                                                         titleLine2: "Message Subheadline")
        let view =  CardsPriority()
        view.contentSectionTitle1.text = middeleSection.titleLine1
        view.contentSectionTitle2.text = middeleSection.titleLine2
        XCTAssertEqual(view.contentSectionTitle1.text, middeleSection.titleLine1)
        XCTAssertEqual(view.contentSectionTitle2.text, middeleSection.titleLine2)
    }

//go ahead

    func testCardsPriority_CTAButtonSection() {
        ///Creating call to action array
        let cta1 = (image:UIImage(named: "24"), title:"SECONDARY CTA")
        let cta2 = (image:UIImage(named: "24"), title:"SECONDARY CTA2")
        let ctaArray: [(image: UIImage?, title: String)] = [cta1, cta2]
        var ctaModel = CardsPriorityCTASection()
        var model = CardsPriorityData()
        ///Preparing CTA Section
        ctaModel = model.prepareCTASection(callToActionData: ctaArray)
        let view =  CardsPriority()
        ///Prepare CTA first button
        let ctaBtn1 = ctaModel.firstItem
        view.callToActionSectionCTA1.setTitle(ctaBtn1?.text, for: .normal)
        view.callToActionSectionCTA1.setImage(ctaBtn1?.image, for: .normal)
        ///Prepare CTA second button
        let ctaBtn2 = ctaModel.secondItem
        view.callToActionSectionCTA2.setTitle(ctaBtn2?.text, for: .normal)
        view.callToActionSectionCTA2.setImage(ctaBtn2?.image, for: .normal)
        XCTAssertEqual(view.callToActionSectionCTA1.titleLabel?.text, ctaBtn1?.text)
        XCTAssertEqual(view.callToActionSectionCTA1.currentImage, ctaBtn1?.image)
        XCTAssertEqual(view.callToActionSectionCTA2.titleLabel?.text, ctaBtn2?.text)
        XCTAssertEqual(view.callToActionSectionCTA2.currentImage, ctaBtn2?.image)
    }
}
