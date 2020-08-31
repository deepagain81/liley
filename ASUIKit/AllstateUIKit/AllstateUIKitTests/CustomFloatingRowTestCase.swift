//
//  FloatingRowTestCase.swift
//  AllstateUIKitTests
//
//  Created by SinghSaggu, Harpreet (INFOSYS) on 18/12/19.
//  Copyright © 2019 Allstate. All rights reserved.
//

import XCTest
@testable import AllstateUIKit

class CustomFloatingRowTestCase: XCTestCase {
    var nilDataType: RowData!
    var rowData: RowData!
    var floatingRow = FloatingRowView()
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        rowData = createRowData()
    }
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        rowData = nil
    }
    /// This function is used to load the data for testing.
    func createRowData() -> RowData {
        var dataType: RowData!
        dataType = RowData(subheadlineTopLabelTitle: "Manufactured Mobile Home",
                           footNoteViewLabelTitle: "#10987654321",
                           informationalAndHiPriNoteLabelTitle:
                                    "This is an example of an informational alert within a floating row component",
                           subheadlineBottomLabelTitle:
                                        "2398 EVERGREEN BLVD NE HWY, ALBUQUERQUE, NM87110",
                           iconImageForAlertInfo: UIImage(named: ""),
                           disclosureImageView: UIImage(named: ""),
                           allStateIconImage: UIImage(named: ""))
        return dataType
    }
    /// This function is used to test the configure function in floatingRow to
    /// check wheather it is passed with nil value or not.
    func testConfigure() {
           ///testing HighPriority row for valid & nil data
           floatingRow.configure(data: rowData!, floatingRowType: .highPriority)
           XCTAssertFalse(floatingRow.isFloatingRowCreationFailed,
                          "HighPriority floating row creation failed for valid data")
           floatingRow.configure(data: nilDataType, floatingRowType: .highPriority)
           XCTAssertTrue(floatingRow.isFloatingRowCreationFailed,
                         "HighPriority floating row creation failed for nil data")
           ///testing Informational row for valid & nil data
           floatingRow.configure(data: rowData!, floatingRowType: .informational)
           XCTAssertFalse(floatingRow.isFloatingRowCreationFailed,
                          "Informational floating row creation failed for valid data")
           floatingRow.configure(data: nilDataType, floatingRowType: .informational)
           XCTAssertTrue(floatingRow.isFloatingRowCreationFailed,
                         "Informational floating row creation failed for nil data")
           ///testing Id card row for valid & nil data
           floatingRow.configure(data: rowData!, floatingRowType: .idCard)
           XCTAssertFalse(floatingRow.isFloatingRowCreationFailed,
                          "Id card floating row creation failed for valid data")
           floatingRow.configure(data: nilDataType, floatingRowType: .idCard)
           XCTAssertTrue(floatingRow.isFloatingRowCreationFailed,
                         "Id card floating row creation failed for nil data")
           ///testing MultiSource row for valid & nil data
           floatingRow.configure(data: rowData!, floatingRowType: .multiSource)
           XCTAssertFalse(floatingRow.isFloatingRowCreationFailed,
                          "MultiSource floating row creation failed for valid data")
           floatingRow.configure(data: nilDataType, floatingRowType: .multiSource)
           XCTAssertTrue(floatingRow.isFloatingRowCreationFailed,
                         "MultiSource floating row creation failed for nil data")
       }
}
