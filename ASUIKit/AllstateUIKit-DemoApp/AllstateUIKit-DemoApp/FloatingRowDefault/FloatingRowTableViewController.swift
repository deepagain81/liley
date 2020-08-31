//
//  FloatingRowTableViewController.swift
//  AllstateUIKit-DemoApp

import UIKit
import AllstateUIKit

class FloatingRowTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? FloatingRowTableViewCell
        cell?.setupFloatingRow(index: indexPath.row)
        return cell!
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectFloatingRow(indexPath: indexPath, isSelected: true)
        showAlert(message: "\(indexPath.row)")
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        selectFloatingRow(indexPath: indexPath, isSelected: false)
    }

    private func selectFloatingRow(indexPath: IndexPath, isSelected: Bool) {
        guard let cell = tableView.cellForRow(at: indexPath) as? FloatingRowTableViewCell else { return }
        cell.floatingRow.didSelectRow(set: isSelected)
    }
}
extension FloatingRowTableViewController {

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
