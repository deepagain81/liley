//
//  FloatingRowTableViewCell.swift
//  AllstateUIKit-DemoApp

import UIKit
import AllstateUIKit

class FloatingRowTableViewCell: UITableViewCell {
    @IBOutlet weak var floatingRow: RowAsView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setupFloatingRow(index: Int) {
        guard let leftIcon = UIImage(named: "leftIcon") else {
            return
        }
        guard let rightIcon = UIImage(named: "rightIcon") else {
            return
        }
        //Preparing data for row
        let rowData = RowData(rowTag: "\(index)",
                              title: "This is row \(index)",
                              subtitle: "Click Now",
                              leftIcon: leftIcon,
                              rightIcon: rightIcon)
        // Creation type2: Default Icon row
        floatingRow.setupDefaultRowIcon(with: rowData, rowType: .defaultRowIcon)
        // If you want to override left or right icon you can do it like this
        floatingRow.leftImage = leftIcon
        floatingRow.allowTapGesture = false
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
