//
//  FloatingRowCellShadowOnOffViewController.swift
//  AllstateUIKit-DemoApp
//
//  Created by Pal, Savita Ramesh (INFOSYS) on 14/01/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import AllstateUIKit
import UIKit

/// viewmodel for FloatingRowCellShadowOnOffViewController
struct FloatingRowViewModel {
    var view: FloatingRowCell?
    var model: RowData

    private enum RowConstants {
        static let defaultLeftIconWidth: CGFloat = 24.0
        static let leadingSpaceForTitle: CGFloat = 16.0
    }

    mutating func generateCell(for indexPath: IndexPath,
                               tableview: UITableView) -> UITableViewCell {
        if view == nil {
            if let cell = tableview.dequeueReusableCell(
                withIdentifier: FloatingRowCell.reuseableIdentifier) as? FloatingRowCell {
                self.setUpCellData(with: cell, indexPath: indexPath)
                return cell
            }
            let cell = FloatingRowCell.init(style: .default, reuseIdentifier: FloatingRowCell.reuseableIdentifier)
            self.setUpCellData(with: cell, indexPath: indexPath)
            self.view = cell
            return cell
        } else {
            return view ?? FloatingRowCell()
        }
    }

    // Setting up cells content data
    func setUpCellData(with cell: FloatingRowCell, indexPath: IndexPath) {
        cell.rowType = .defaultRow
        if indexPath.row == 5 {
            cell.isShadowEnabled = true
        } else {
                cell.isShadowEnabled = false
            cell.isSeparatorLineRequired = true
        }
        cell.backgroundColor = UIColor.clear
        cell.setupCell(with: model, type: .defaultRow)
    }
}

class FloatingRowCellShadowOnOffViewController: UITableViewController {
    // MARK: - Local variavles
    var tableviewContents = [FloatingRowViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()
        tableView.backgroundColor = UIColor.groundFloor
        tableView.separatorStyle = .none
        /// Setup data source for tableview
        setupTableviewContent()
    }

    /// Setting up tableview array
    func setupTableviewContent() {
        // generate view-model array
        let rightIcon = UIImage(named: "rightIcon")
        for index in  0...5 {
            let rowData = RowData(rowTag: "rowID-\(index)",
                title: "This is row \(index)",
                subtitle: "",
                leftIcon: nil,
                rightIcon: rightIcon)
            tableviewContents.append(FloatingRowViewModel(view: nil, model: rowData))
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableviewContents.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var viewModel = tableviewContents[indexPath.row]
        return viewModel.generateCell(for: indexPath, tableview: tableView)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectFloatingRow(indexPath: indexPath, isSelected: true)
        showAlert(message: "\(indexPath.row)", indexPath: indexPath)
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectFloatingRow(indexPath: indexPath, isSelected: false)
    }

    private func selectFloatingRow(indexPath: IndexPath, isSelected: Bool) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FloatingRowCell else { return }
        cell.didSelectFloatingRow(selected: isSelected)
    }
}
extension FloatingRowCellShadowOnOffViewController {

    func showAlert(message: String, indexPath: IndexPath) {
        //Do something on row press
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert",
                                          message: "This is Row \(message) click event.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.tableView(self.tableView, didDeselectRowAt: indexPath)
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

}
