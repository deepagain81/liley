//
//  StatusHeaderTestCase.swift
//  AllstateUIKitTests
//
//  Created by Jayaveeran, Saranya (INFOSYS) on 05/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//
@testable import AllstateUIKit
import XCTest

class StatusHeaderTestCase: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

    }
    //TBD: Need to update test case with dynamic data once integrated with webservice
    func getStatusData(with type: StatusType) -> [StatusHeaderData] {
        let statusData = StatusHeaderData(with: type,
                                          statusMessageText: "Sorry for the inconvenience. Your info will be up soon.",
                                          statusHeaderType: .highPriority)
        let statusDataPriority = StatusHeaderData(with: type,
                                                  statusMessageText: "Source/Subheadline - Alert Message",
                                                  statusHeaderType: .priority)
        let statusArray = [statusData, statusDataPriority]
        return statusArray
    }

    func testStatusBuilder_WithStatusType_ShouldCreateandConfigStatus() {
        let statusHeaderDataArray = getStatusData(with: .header)
        guard let statusHeader = statusBuilder.create(with: statusHeaderDataArray[0]) as? StatusHeaderView
            else { return }
        XCTAssertTrue(statusHeader.getStatusLabelText() == "Sorry for the inconvenience. Your info will be up soon.",
                      "Failed: Title text is not - Sorry for the inconvenience. Your info will be up soon.")

         let statusDisclosureDataArray =  getStatusData(with: .disclosure)
        guard let statusDisclosure = statusBuilder.create(with: statusDisclosureDataArray[1]) as? StatusHeaderView
            else { return }
        XCTAssertTrue(statusDisclosure.getStatusLabelText() == "Source/Subheadline - Alert Message",
                      "Failed: Title text is not - Source/Subheadline - Alert Message")

    }

    func testStatusView_WithStatusType_ShouldCreateandConfigStatus() {
        let statusHeaderDataArray = getStatusData(with: .header)
        let statusHeaderView = StatusHeaderView()
        statusHeaderView.reloadStatusView(with: statusHeaderDataArray[0])
        XCTAssertTrue(statusHeaderView.getStatusLabelText() ==
            "Sorry for the inconvenience. Your info will be up soon.",
                      "Failed: Title text is not - Sorry for the inconvenience. Your info will be up soon.")
        XCTAssertNotNil(statusHeaderView.getStatusLabelText())
        statusHeaderView.reloadStatusView(with: statusHeaderDataArray[1])
        XCTAssertTrue(statusHeaderView.getStatusLabelText() ==
            "Source/Subheadline - Alert Message",
                      "Failed: Title text is not - Source/Subheadline - Alert Message")
        XCTAssertNotNil(statusHeaderView.getStatusLabelText())

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
            let statusHeaderDataArray = getStatusData(with: .header)
            let statusHeaderView = StatusHeaderView()
            statusHeaderView.reloadStatusView(with: statusHeaderDataArray[0])
        }
    }

}
