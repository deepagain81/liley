//
//  TableViewController.swift
//  AllstateUIKit-DemoApp
//

import UIKit
import AllstateUIKit

class SearchBarTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet private weak var searchbarOutlet: UISearchBar!
    private let placeholder = "Search"
    private let navTitle = "Title"
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.navigationController?.setNavigationBarAttributes()
        searchbarOutlet.tintColor = UIColor.primaryDeepBlue
        searchbarOutlet.placeholder = placeholder
        searchbarOutlet.delegate = self
        self.navigationItem.title = navTitle
        self.navigationController?.navigationBar.prefersLargeTitles=false
        searchbarOutlet.searchTextField.textColor = UIColor.grey7
        searchbarOutlet.searchTextField.font = ASTheme.font.body
    // MARK: - Table view data source -

     func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1000
    }
}

    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchbarOutlet.text = ""
        searchbarOutlet.showsCancelButton = false
        searchBar.resignFirstResponder()
    }

    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchbarOutlet.showsCancelButton = true
    }
}
