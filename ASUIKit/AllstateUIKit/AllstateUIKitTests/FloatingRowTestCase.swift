//
//  FloatingRowTestCase.swift
//  AllstateUIKitTests
//
//  Created by SinghSaggu, Harpreet (INFOSYS) on 18/12/19.
//  Copyright © 2019 Allstate. All rights reserved.
//

import XCTest
@testable import AllstateUIKit

class FloatingRowTestCase: XCTestCase {
    var rowView: RowAsView!
    var rowVariationView: RowVariationAsView!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    /// Testing creation of default row icon and matching model values with configured values.
    func testSetupSampleDefaultIconRow() {
        //Preparing data for row
        let rowData = RowData(rowTag: "3", title: "Click here to view floating row tableview implementation",
                              subtitle: "Go now", leftIcon: nil, rightIcon: nil)
        //Creation type2: Default Icon row
        let defaultIconRowView = floatingRowBuilder.create(with: rowData, type:
            .defaultRowIcon, onClick: nil) as? RowAsView
        XCTAssertEqual(rowData.title, defaultIconRowView!.title)
        XCTAssertEqual(rowData.subtitle, defaultIconRowView!.subtitle)
    }
    /// Testing creation of default row icon and matching model values with configured values.
    func testSetupSampleDefaultIconVariationRow() {
        //Preparing data for row
        let rowData = RowData(rowTag: "3", title:
            "Click here to view floating row tableview implementation",
                              subtitle: "Go now", detailSubtitle: "Test Case to check Functionality",
                              leftIcon: nil, rightIcon: nil)
        //Creation type2: Default Icon row
        let defaultIconVariationRowView = floatingRowBuilder.create(with: rowData, type:
            .defaultVariationRowIcon, onClick: nil) as? RowVariationAsView
        XCTAssertEqual(rowData.title, defaultIconVariationRowView!.title)
        XCTAssertEqual(rowData.subtitle, defaultIconVariationRowView!.subtitle)
        XCTAssertEqual(rowData.detailSubtitle, defaultIconVariationRowView!.detailSubtitle)
    }

    /// Testing creation of default row image and matching model values with configured values.
    func testSetupSampleDefaultImageVariationRow() {
        //Preparing data for row
        //Assign
        let rowData = RowData(rowTag: "4", title:
            "Click here to view floating row tableview implementation",
                              subtitle: "Go now", agentImage: nil, disclosureImage: nil)
        //Creation type2: Default Icon row
        //Act
        let defaultImageVariationRowView = floatingRowBuilder.create(with: rowData, type:
            .defaultVariationRowImage, onClick: nil) as? AgentFloatingRowView
        //Asserts
        XCTAssertEqual(rowData.title, defaultImageVariationRowView!.title)
        XCTAssertEqual(rowData.subtitle, defaultImageVariationRowView!.subtitle)
    }

    /// Testing selection of row, whether the selection color matches the actual background color of view.
    func testSelectedDeselectedRow() {
        rowView = RowAsView()
        // selecting row
        rowView.didSelectRow(set: true)
        let selectedColor = UIColor.greyShadow
        let deselectedColor = UIColor.whiteColor
        XCTAssertEqual(selectedColor, rowView.contentView.backgroundColor)
        // Deselecting row
        rowView.didSelectRow(set: false)
        XCTAssertEqual(deselectedColor, rowView.contentView.backgroundColor)
    }
    /// Testing selection of row, whether the selection color matches the actual background color of view.
    func testSelectedDeselectedVariationRow() {
        rowVariationView = RowVariationAsView()
        // selecting row
        rowVariationView.didSelectRow(set: true)
        let selectedColor = UIColor.greyShadow
        XCTAssertEqual(selectedColor, rowVariationView.contentView.backgroundColor)
    }

    /// Testing whether the reload functions actually reloads the new data in the view
    func testReloadDataRow() {
        let rowData = RowData(rowTag: "3", title:
            "Click here to view floating row tableview implementation",
                              subtitle: "Go now", leftIcon: nil, rightIcon: nil)
        //Creation type2: Default Icon row
        let defaultIconRowView = floatingRowBuilder.create(with: rowData, type:
            .defaultRowIcon, onClick: nil) as? RowAsView
        XCTAssertEqual(rowData.title, defaultIconRowView!.title)
        XCTAssertEqual(rowData.subtitle, defaultIconRowView!.subtitle)
        // New data to reload in the same view
        let reloadRowData = RowData(rowTag: "4", title: "This is the new reload data",
                                    subtitle: "Click now", leftIcon: nil, rightIcon: nil)
        defaultIconRowView?.reloadRow(with: reloadRowData)
        XCTAssertEqual(reloadRowData.title, defaultIconRowView!.title)
        XCTAssertEqual(reloadRowData.subtitle, defaultIconRowView!.subtitle)
        //Creation type2: Default row
        let defaultRowView = floatingRowBuilder.create(with: rowData, type: .defaultRow, onClick: nil) as? RowAsView
        defaultRowView?.reloadRow(with: reloadRowData)
        XCTAssertEqual(reloadRowData.title, defaultRowView!.title)
        XCTAssertEqual(reloadRowData.subtitle, defaultRowView!.subtitle)
    }

    /// Testing whether the reload functions actually reloads the new data in the view
    func testReloadDataVariationRow() {
        let rowData = RowData(rowTag: "3", title:
            "Click here to view floating row tableview implementation",
                              subtitle: "Go now", detailSubtitle: "Test Case to check Functionality",
                              leftIcon: nil, rightIcon: nil)
        //Creation type2: Default Icon Variation row
        let defaultIconVariationRowView = floatingRowBuilder.create(
            with: rowData, type: .defaultVariationRowIcon,
            onClick: nil) as? RowVariationAsView
        XCTAssertEqual(rowData.title, defaultIconVariationRowView!.title)
        XCTAssertEqual(rowData.subtitle, defaultIconVariationRowView!.subtitle)
        XCTAssertEqual(rowData.detailSubtitle, defaultIconVariationRowView!.detailSubtitle)
        // New data to reload in the same view
        let reloadRowData = RowData(rowTag: "4", title: "This is the new reload data",
                                    subtitle: "Click now", detailSubtitle:
            "Data will be reloaded successfully", leftIcon: nil, rightIcon: nil)
        defaultIconVariationRowView?.reloadRow(with: reloadRowData)
        XCTAssertEqual(reloadRowData.title, defaultIconVariationRowView!.title)
        XCTAssertEqual(reloadRowData.subtitle, defaultIconVariationRowView!.subtitle)
        //Creation type2: Default row
        let defaultRowVariationView = floatingRowBuilder.create(with: rowData,
                                                                type: .defaultVariationRow, onClick: nil) as? RowVariationAsView
        defaultRowVariationView?.reloadRow(with: reloadRowData)
        XCTAssertEqual(reloadRowData.title, defaultRowVariationView!.title)
        XCTAssertEqual(reloadRowData.subtitle, defaultRowVariationView!.subtitle)
    }

    /// Testing setupDefaultRow function which is exposed when row is initialized from storyboard
    func testSetupDefaultRowForStoryboard() {
        rowView = RowAsView()
        let rowData = RowData(rowTag: "1", title:
            "Click here to view floating row tableview implementation",
                              subtitle: "Go now", leftIcon: nil, rightIcon: nil)
        //Creation type2: Default Icon row
        rowView.setupDefaultRowIcon(with: rowData, rowType: .defaultRowIcon)
        XCTAssertEqual(rowData.title, rowView!.title)
        XCTAssertEqual(rowData.subtitle, rowView!.subtitle)
        //Creation type2: Default row
        rowView.setupDefaultRowIcon(with: rowData, rowType: .defaultRow)
        XCTAssertEqual(rowData.title, rowView!.title)
        XCTAssertEqual(rowData.subtitle, rowView!.subtitle)
    }

    /// Testing getter/setter available for default row view
    func testGetterSettersForRow() {
        rowView = RowAsView()
        let rowData = RowData(rowTag: "1", title:
            "Click here to view floating row tableview implementation",
                              subtitle: "Go now", leftIcon: nil, rightIcon: nil)
        // Creating default row icon view
        let defaultIconRowView = floatingRowBuilder.create(with: rowData,
                                                           type: .defaultRowIcon, onClick: nil) as? RowAsView
        XCTAssertEqual(rowData.title, defaultIconRowView!.title)
        XCTAssertEqual(rowData.subtitle, defaultIconRowView!.subtitle)
        // Changing title, subtitle value
        let titleValue = "new title"
        let subtitleValue = "new subtitle"
        // applying title,subtitle to the created view
        defaultIconRowView?.title = titleValue
        defaultIconRowView?.subtitle = subtitleValue
        XCTAssertEqual(titleValue, defaultIconRowView!.title)
        XCTAssertEqual(subtitleValue, defaultIconRowView!.subtitle)
    }
    /// Testing getter/setter available for default variation row view
    func testGetterSettersForVariationRow() {
        rowVariationView = RowVariationAsView()
        let rowData = RowData(rowTag: "1", title:
            "Click here to view floating row tableview implementation",
                              subtitle: "Go now", detailSubtitle: "Test Case to check Functionality",
                              leftIcon: nil, rightIcon: nil)
        // Creating default row icon view
        let defaultIconVariationRowView = floatingRowBuilder.create(with:
            rowData, type: .defaultVariationRowIcon, onClick: nil) as? RowVariationAsView
        XCTAssertEqual(rowData.title, defaultIconVariationRowView!.title)
        XCTAssertEqual(rowData.subtitle, defaultIconVariationRowView!.subtitle)
        XCTAssertEqual(rowData.detailSubtitle, defaultIconVariationRowView!.detailSubtitle)
        // Changing title, subtitle value
        let titleValue = "new title"
        let subtitleValue = "new subtitle"
        let detailSubtitleValue = "new subtitle"
        // applying title,subtitle to the created view
        defaultIconVariationRowView?.title = titleValue
        defaultIconVariationRowView?.subtitle = subtitleValue
        defaultIconVariationRowView?.detailSubtitle = detailSubtitleValue
        XCTAssertEqual(titleValue, defaultIconVariationRowView!.title)
        XCTAssertEqual(subtitleValue, defaultIconVariationRowView!.subtitle)
        XCTAssertEqual(detailSubtitleValue, defaultIconVariationRowView!.detailSubtitle)
    }
}
