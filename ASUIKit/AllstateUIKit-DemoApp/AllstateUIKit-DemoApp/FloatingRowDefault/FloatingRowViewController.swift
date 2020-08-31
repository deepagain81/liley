//
//  FloatingRowViewController.swift
//  AllstateUIKit-DemoApp

import Foundation
import UIKit
import AllstateUIKit

class FloatingRowViewController: UIViewController {
    @IBOutlet weak var rowStackView: UIStackView!
    @IBOutlet weak var rowFromStoryboard: RowAsView!
    var defaultIconRowView: RowAsView?
    var defaultRowView: RowAsView?
    var defaultIconVariationRowView: RowVariationAsView?
    var defaultVariationRowView: RowVariationAsView?
    var defaultImageVariationRowView: AgentFloatingRowView?

    override func viewDidLoad() {
        super.viewDidLoad()
        //Explains the ASTheme interface
        self.view.backgroundColor = ASTheme.color.background
        //Explains the ASUIKit interface
        setupSampleDefaultRow()
        setupSampleDefaultIconRow()
        setupSampleDefaultIconRowFromStoryboard()
        setupSampleDefaultRowShadowOnOff()
        setupSampleDefaultVariationRow()
        setupSampleDefaultIconVariationRow()
        setupSampleDefaultImageVariationRow()
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
        rowFromStoryboard.setupDefaultRowIcon(with: rowData, rowType: .defaultRowIcon)
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
        let rowData = RowData(rowTag: "3",
                                title: "Click here to view floating row tableview implementation (as a UIView)",
                                subtitle: "Go now",
                                leftIcon: leftIcon,
                                rightIcon: rightIcon)
        //Creation type2: Default Icon row
        guard let defaultIconRow = floatingRowBuilder.create(with: rowData,
                                                            type: .defaultRowIcon,
                                                            onClick: nil) as? RowAsView
            else { return }
        defaultIconRowView = defaultIconRow
        defaultIconRowView?.setRowDelegate(as: self)
        //Add row to stackview
        rowStackView.addArrangedSubview(defaultIconRow)
    }
    func setupSampleDefaultRow() {
        guard let rightIcon = UIImage(named: "rightIcon") else { return }
        //Preparing data for row
        let rowData = RowData(rowTag: "rowID1",
                                title: "Click here to view floating row tableview implementation (as a UITVC)",
                                subtitle: "Enroll Now",
                                leftIcon: nil,
                                rightIcon: rightIcon)
        //Creation type1: Default row
        let defaultRow = floatingRowBuilder.create(with: rowData, type: .defaultRow, onClick: { (_) in
            let identifier = "FloatingRowCellTableViewController"
            guard let demoViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
                // view controller not found or invalid storyboard identifier
                return
            }
            self.defaultRowView?.didSelectRow(set: false)
            // force wrap navigation contoller, it must exists,
            self.navigationController!.pushViewController(demoViewController, animated: true)
        }) as? RowAsView
        if let rowView = defaultRow {
            defaultRowView = rowView
            //Add row to stackview
            rowStackView.addArrangedSubview(rowView)
        }
    }
    func setupSampleDefaultRowShadowOnOff() {
        guard let rightIcon = UIImage(named: "rightIcon") else { return }
        //Preparing data for row
        let rowData = RowData(rowTag: "rowID1",
                                title:
            "Click here to view floating row tableview implementation (as a UITVC) with Shadow On / Off implementation",
                                subtitle: "Click Now",
                                leftIcon: nil,
                                rightIcon: rightIcon)
        //Creation type1: Default row
        let defaultRow = floatingRowBuilder.create(with: rowData, type: .defaultRow, onClick: { (_) in
            let identifier = "FloatingRowCellShadowOnOffViewController"
            guard let demoViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
                // view controller not found or invalid storyboard identifier
                return
            }
            self.defaultRowView?.didSelectRow(set: false)
            // force wrap navigation contoller, it must exists,
            self.navigationController!.pushViewController(demoViewController, animated: true)
        }) as? RowAsView
        if let rowView = defaultRow {
            defaultRowView = rowView
            //Add row to stackview
            rowStackView.addArrangedSubview(rowView)
        }
    }
    func setupSampleDefaultIconVariationRow() {
        guard let leftIcon = UIImage(named: "leftIcon") else {
            return
        }
        guard let rightIcon = UIImage(named: "rightIcon") else {
            return
        }
        //Preparing data for row
        let rowData = RowData(rowTag: "4", title: "Make a walkthrough video",
                detailSubtitle: "Create a quick overview of all your items to complement your inventory.",
                                leftIcon: leftIcon,
                                rightIcon: rightIcon)
        //Creation type2: Default Icon row
        guard let defaultIconVariationRow = floatingRowBuilder.create(with: rowData,
                                                             type: .defaultVariationRowIcon,
                                                            onClick: nil) as? RowVariationAsView
            else { return }
        defaultIconVariationRowView = defaultIconVariationRow
        defaultIconVariationRowView?.setRowDelegate(as: self)
        //Add row to stackview
        rowStackView.addArrangedSubview(defaultIconVariationRow)
    }

    func setupSampleDefaultImageVariationRow() {
        guard let agentImage = UIImage(named: "photo")
            else { return }
        guard let disclosureImage = UIImage(named: "Disclosure Arrow")
            else { return }
        //Preparing data for row
        let rowData = RowData(rowTag: "6", title: "Maria Alexandria Cruz",
                subtitle: "3504 Belt Line Rd #105. Farmers Branch, TX 75234",
                                agentImage: agentImage,
                                disclosureImage: disclosureImage)
        //Creation type2: Default Image row
        guard let defaultImageVariationRow = floatingRowBuilder.create(with: rowData,
                                                             type: .defaultVariationRowImage,
                                                            onClick: nil) as? AgentFloatingRowView
            else { return }
        defaultImageVariationRowView = defaultImageVariationRow
        defaultImageVariationRowView?.setRowDelegate(as: self)
        //Add row to stackview
        rowStackView.addArrangedSubview(defaultImageVariationRow)
    }

    func setupSampleDefaultVariationRow() {
        guard let rightIcon = UIImage(named: "rightIcon") else { return }
        //Preparing data for row
        let rowData = RowData(rowTag: "5",
                                title: "ID Cards and Documents",
                                subtitle: "Get help",
                                detailSubtitle: "Create quick overview of all your items to complement your inventory.",
                                leftIcon: nil,
                                rightIcon: rightIcon)
        //Creation type1: Default row
        let defaultRow = floatingRowBuilder.create(with: rowData, type: .defaultVariationRow, onClick: { (_) in
            let identifier = "FloatingRowCellTableViewController"
            guard let demoViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
                // view controller not found or invalid storyboard identifier
                return
            }
            self.defaultVariationRowView?.didSelectRow(set: false)
            // force wrap navigation contoller, it must exists,
            self.navigationController!.pushViewController(demoViewController, animated: true)
        }) as? RowVariationAsView
        if let rowView = defaultRow {
            defaultVariationRowView = rowView
            //Add row to stackview
            rowStackView.addArrangedSubview(rowView)
        }
    }
}

extension FloatingRowViewController: RowDelegate {
    func didPressRow(tag: String) {
        if tag == "3" {
            let identifier = "FloatingRowTableViewController"
            guard let demoViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
                // view controller not found or invalid storyboard identifier
                return
            }
            defaultIconRowView?.didSelectRow(set: false)
            // force wrap navigation contoller, it must exists,
            self.navigationController!.pushViewController(demoViewController, animated: true)
        } else {
            //Do something on row press
            DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert",
                                          message: "This is FRDefaultIcon click event.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style {
                case .default:
                        if tag == "rowID2" {
                            self.rowFromStoryboard?.didSelectRow(set: false)
                        } else if tag == "4" {
                            self.defaultIconVariationRowView?.didSelectRow(set: false)
                        } else if tag == "6" {
                            self.defaultImageVariationRowView?.didSelectRow(set: false)
                        } else {
                            self.defaultIconRowView?.didSelectRow(set: false)
                        }
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
    }
}

extension FloatingRowViewController: StoryboardIdentifierProtocol {
    static var storyboardID: String {
        return "FloatingRowViewController"
    }
}
