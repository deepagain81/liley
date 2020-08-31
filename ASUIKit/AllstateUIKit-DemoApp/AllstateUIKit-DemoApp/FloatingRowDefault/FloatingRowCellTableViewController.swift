//
//  FloatingRowTableViewController.swift
//  AllstateUIKit-DemoApp
//
//  Created by SinghSaggu, Harpreet (INFOSYS) on 26/12/19.
//  Copyright © 2019 Allstate. All rights reserved.
//

import UIKit
import AllstateUIKit

/// viewmodel for FloatingRowCellTableViewController
struct ViewModel {
    static let cellIdentifier = "floatingRowCellIdentififer"
    var view: FloatingRowCell?
    var model: RowData
    mutating func generateCell(for indexPath: IndexPath,
                               tableview: UITableView,
                               viewModel: ViewModel) -> UITableViewCell {
        if view == nil {
            if let cell = tableview.dequeueReusableCell(
                withIdentifier: ViewModel.cellIdentifier) as? FloatingRowCell {
                cell.setupCell(with: model, type: .defaultRow)
                return cell
            }
            let cell = FloatingRowCell.init(style: .default, reuseIdentifier: ViewModel.cellIdentifier)
            cell.setupCell(with: model, type: .defaultRow)
            self.view = cell
            return cell
        } else {
            return view ?? FloatingRowCell()
        }
    }
}

class FloatingRowCellTableViewController: UITableViewController {
    // MARK: - Local variavles
    var tableviewContents = [ViewModel]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        /// Setup data source for tableview
        setupTableviewContent()
    }

    /// Setting up tableview array
    func setupTableviewContent() {
        // generate view-model array
        let rightIcon = UIImage(named: "rightIcon")
        for index in  0...100 {
            let rowData = RowData(rowTag: "rowID-\(index)",
                title: "This is row \(index)",
                subtitle: "Click Now",
                leftIcon: nil,
                rightIcon: rightIcon)
            tableviewContents.append(ViewModel(view: nil, model: rowData))
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
        return viewModel.generateCell(for: indexPath, tableview: tableView, viewModel: viewModel)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectFloatingRow(indexPath: indexPath, isSelected: true)
        showAlert(message: "\(indexPath.row)")
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectFloatingRow(indexPath: indexPath, isSelected: false)
    }

    private func selectFloatingRow(indexPath: IndexPath, isSelected: Bool) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FloatingRowCell else { return }
        cell.didSelectFloatingRow(selected: isSelected)
    }
}
extension FloatingRowCellTableViewController {

    func showAlert(message: String) {
        //Do something on row press
        DispatchQueue.main.async {
            let alert = UIAlertController(title: "Alert",
                                          message: "This is Row \(message) click event.",
                preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            }))
            self.present(alert, animated: true, completion: nil)
        }
    }

}
