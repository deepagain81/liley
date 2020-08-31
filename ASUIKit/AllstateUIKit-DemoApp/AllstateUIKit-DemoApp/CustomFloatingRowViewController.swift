//
//  CustomFloatingRowViewController.swift
//  AllstateUIKit-DemoApp
//
//  Created by C, Prasanth (INFOSYS) on 11/12/19.
//  Copyright © 2019 Allstate. All rights reserved.
//

import Foundation
import UIKit
import AllstateUIKit

class CustomFloatingRowViewController: UIViewController {
    @IBOutlet weak var baseScrollView: UIScrollView!
    @IBOutlet weak var baseStackView: UIStackView!
    @IBOutlet weak var floatingRowBaseView: FloatingRowView!
    @IBOutlet weak var floatingRowBaseView1: FloatingRowView!
    var cardBottomBgView = UIStackView()
    override func viewDidLoad() {
        super.viewDidLoad()
        //Explains the ASTheme interface
        self.view.backgroundColor = ASTheme.color.background
        //Explains the ASUIKit interface
        setupSampleInformationalRowFromStoryboard()
        setupSampleMultisourceRow()
        setupSampleInformationalRow()
        setupSampleHighPriorityRow()
        setupSampleIdCardRow()
    }
    // MARK: - ------- Floating Row (Multisource, Informational, High Priority, ID Card)-------
    func setupSampleInformationalRowFromStoryboard() {
        let rowData = RowData(subheadlineTopLabelTitle: "Manufactured Mobile Home",
        footNoteViewLabelTitle: "#10987654321",
        informationalAndHiPriNoteLabelTitle:
            "This is an example of an informational alert within a floating row component",
        subheadlineBottomLabelTitle:
            "2398 EVERGREEN BLVD NE HWY, ALBUQUERQUE, NM87110", iconImageForAlertInfo: UIImage(
                named: "aboutInfoC"), disclosureImageView: UIImage(
                named: "disclosure"),
        allStateIconImage: UIImage(
        named: "primaryLogoBlue"),
        rowTag: "1")
        floatingRowBaseView.changeRowType(to: .informational)
        floatingRowBaseView.reloadRow(with: rowData)
        floatingRowBaseView.setRowDelegate(as: self)
    }
    // Set up Floating Row
    func setupSampleMultisourceRow() {
        //Preparing data for row
        let rowData = RowData(subheadlineTopLabelTitle: "Manufactured Mobile Home",
        footNoteViewLabelTitle: "#10987654321",
        informationalAndHiPriNoteLabelTitle:
            "This is an example of an informational alert within a floating row component",
        subheadlineBottomLabelTitle:
            "2398 EVERGREEN BLVD NE HWY, ALBUQUERQUE, NM87110", iconImageForAlertInfo: UIImage(
                named: "aboutInfoC"), disclosureImageView: UIImage(
                named: "disclosure"),
        allStateIconImage: UIImage(
        named: "primaryLogoBlue"),
        rowTag: "2")
        addRowToBaseView(data: rowData, type: .multiSource)
    }
    func setupSampleInformationalRow() {
        //Preparing data for row
        let rowData = RowData(subheadlineTopLabelTitle: "Manufactured Mobile Home",
        footNoteViewLabelTitle: "#10987654321",
        informationalAndHiPriNoteLabelTitle:
            "This is an example of a",
        subheadlineBottomLabelTitle:
            "2398 EVERGREEN BLVD NE HWY, ALBUQUERQUE, NM87110", iconImageForAlertInfo: UIImage(
                named: "aboutInfoC"), disclosureImageView: UIImage(
                named: "disclosure"),
        allStateIconImage: UIImage(
        named: "primaryLogoBlue"),
        rowTag: "3")
        addRowToBaseView(data: rowData, type: .informational)
    }
    func setupSampleHighPriorityRow() {
        //Preparing data for row
        let rowData = RowData(subheadlineTopLabelTitle: "Manufactured Mobile Home",
        footNoteViewLabelTitle: "#10987654321",
        informationalAndHiPriNoteLabelTitle:
            "This is an example of an informational alert within a floating row component",
        subheadlineBottomLabelTitle:
            "2398 EVERGREEN BLVD NE HWY, ALBUQUERQUE, NM87110", iconImageForAlertInfo: UIImage(
                named: "alertS"), disclosureImageView: UIImage(
                named: "disclosure"),
        allStateIconImage: UIImage(
        named: "primaryLogoBlue"),
        rowTag: "4")
        addRowToBaseView(data: rowData, type: .highPriority)
    }
    func setupSampleIdCardRow() {
        //Preparing data for row
        let rowData = RowData(subheadlineTopLabelTitle: "Manufactured Mobile Home",
        footNoteViewLabelTitle: "#10987654321",
        informationalAndHiPriNoteLabelTitle:
            "This is an example of an informational alert within a floating row component",
        subheadlineBottomLabelTitle:
            "2398 EVERGREEN BLVD NE HWY, ALBUQUERQUE, NM87110", iconImageForAlertInfo: UIImage(
                named: "aboutInfoC"), disclosureImageView: UIImage(
                named: "disclosure"),
        allStateIconImage: UIImage(
        named: "primaryLogoBlue"),
        rowTag: "5")
        addRowToBaseView(data: rowData, type: .idCard)
    }
    func addRowToBaseView(data: RowData, type: RowType) {
        let floatingRow =  floatingRowBuilder.create(with: data, type: type, onClick: nil)
        floatingRow.setRowDelegate(as: self)
        baseStackView.addArrangedSubview(floatingRow)
    }
}

extension CustomFloatingRowViewController: RowDelegate {
    func didPressRow(tag: String) {
        //Do something on row press
        let alert = UIAlertController(title: "Alert",
                                      message: "This is FRDefaultIcon click event.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style {
            case .default:
                print("default")
            case .cancel:
                print("cancel")
            case .destructive:
                print("destructive")
            default:
                break
            }}))
        self.present(alert, animated: true, completion: nil)
    }
}

extension CustomFloatingRowViewController: StoryboardIdentifierProtocol {
    static var storyboardID: String {
        return "CustomFloatingRowViewController"
    }
}
