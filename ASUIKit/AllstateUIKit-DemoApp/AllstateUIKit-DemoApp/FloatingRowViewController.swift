//
//  FloatingRowViewController.swift
//  AllstateUIKit-DemoApp

import Foundation
import UIKit
import AllstateUIKit

class FloatingRowViewController: UIViewController {
    @IBOutlet weak var rowStackView: UIStackView!
    @IBOutlet weak var rowFromStoryboard: RowAsView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Explains the ASTheme interface
        self.view.backgroundColor = ASTheme.color.background
        //Explains the ASUIKit interface
        setupSampleDefaultRow()
        setupSampleDefaultIconRow()
        setupSampleDefaultIconRowFromStoryboard()
    }

    func setupSampleDefaultIconRowFromStoryboard() {
        guard let leftIcon = UIImage(named: "leftIcon") else {
            return
        }
        guard let rightIcon = UIImage(named: "rightIcon") else {
            return
        }
        //Preparing data for row
        let rowData = RowData(rowTag: "rowID2",
                                title: "This row is initiated from storyboard!",
                                subtitle: "Click Now",
                                leftIcon: leftIcon,
                                rightIcon: rightIcon)
        //Creation type2: Default Icon row
        rowFromStoryboard.setupDefaultRow(with: rowData, rowType: .defaultRowIcon)
        // If you want to override left or right icon you can do it like this
        rowFromStoryboard.leftImage = leftIcon
        rowFromStoryboard.setRowDelegate(as: self)

    }

    func setupSampleDefaultIconRow() {
        guard let leftIcon = UIImage(named: "leftIcon") else {
            return
        }
        guard let rightIcon = UIImage(named: "rightIcon") else {
            return
        }
        //Preparing data for row
        let rowData = RowData(rowTag: "rowID2",
                                title: "Wow, this text is really very very long!",
                                subtitle: "Enroll Now",
                                leftIcon: leftIcon,
                                rightIcon: rightIcon)
        //Creation type2: Default Icon row
        let defaultIconRowView =  ASFloatingRowBuilder.create(with: rowData, type: .defaultRowIcon)
        defaultIconRowView.setRowDelegate(as: self)
        //Add row to stackview
        rowStackView.addArrangedSubview(defaultIconRowView)
    }
    func setupSampleDefaultRow() {
        guard let rightIcon = UIImage(named: "rightIcon") else {
            return
        }
        //Preparing data for row
        let rowData = RowData(rowTag: "rowID1",
                                title: "AutoPay",
                                subtitle: "Enroll Now",
                                leftIcon: nil,
                                rightIcon: rightIcon)
        //Creation type1: Default row
        let defaultIconRowView =  ASFloatingRowBuilder.create(with: rowData, type: .defaultRow)
        defaultIconRowView.setRowDelegate(as: self)
        //Add row to stackview
        rowStackView.addArrangedSubview(defaultIconRowView)
    }
}

extension FloatingRowViewController: RowDelegate {
    func didRowPressed(tag: String) {
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

extension FloatingRowViewController: StoryboardIdentifierProtocol {
    static var storyboardID: String {
        return "FloatingRowViewController"
    }
}
