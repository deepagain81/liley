//
//  FloatingRowTableViewCell.swift
//  AllstateUIKit
//
//  Created by SinghSaggu, Harpreet (INFOSYS) on 01/01/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import UIKit

public class FloatingRowCell: UITableViewCell {
    // MARK: - Local variables
    // enum for all constants
    private enum RowConstants {
        static let zero: CGFloat = 0.0
        static let bottomSpace: CGFloat = -8.0
        static let defaultLeftIconWidth: CGFloat = 24.0
        static let leadingSpaceForTitle: CGFloat = 16.0
        static let separatorLineHeight: CGFloat = 1.0
    }
    private var floatingRowView: RowAsView!

    public var isShadowEnabled: Bool = true {
        didSet {
            floatingRowView.isShadowEnabled = isShadowEnabled
            updateFloatingRowBottomConstraints()
        }
    }

    public var rowType: RowType = .defaultRow
    public var isSeparatorLineRequired: Bool = false {
        didSet {
            if isSeparatorLineRequired {
                createSeparatorLineView()
            }
        }
    }

    public static let reuseableIdentifier = "floatingRowCellIdentififer"

    /// Overiding method for tableview cell initialization
    /// - Parameters:
    ///   - style: UITableViewCell style
    ///   - reuseIdentifier: reuseIdentifier for cell
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        createFloatingRowView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /// Initial setup of floating row view
    private func createFloatingRowView() {
        let rowData = RowData()
        if let view = floatingRowBuilder.create(with: rowData, type: .defaultRow, onClick: nil) as? RowAsView {
            view.allowTapGesture = false
            floatingRowView = view
            self.contentView.addSubview(view)
            self.selectionStyle = .none
            ///constraints for the view
            addConstraints(view: view)
        }
    }

    /// Adding constraints on self for given view.
    /// - Parameter view: relative view
    private func addConstraints(view: RowAsView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,
                                      constant: RowConstants.zero).isActive = true
        view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,
                                       constant: RowConstants.zero).isActive = true
        view.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,
                                     constant: RowConstants.zero).isActive = true
    }

    /// Initial setup of separator line view
    private func createSeparatorLineView() {
        let separatorView = UIView()
        separatorView.backgroundColor = UIColor.groundFloor
        self.contentView.addSubview(separatorView)
        addSeparatorLineConstraints(view: separatorView)
    }

    /// Adding constraints for separator line view.
    /// - Parameter view: separator line view
    private func addSeparatorLineConstraints(view: UIView) {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor,
                                       constant: RowConstants.zero).isActive = true
        view.heightAnchor.constraint(equalToConstant: RowConstants.separatorLineHeight).isActive = true
        view.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,
                                     constant: RowConstants.zero).isActive = true
        if rowType == .defaultRow {
            view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,
            constant: RowConstants.leadingSpaceForTitle).isActive = true
        } else {
            view.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor,
            constant: RowConstants.leadingSpaceForTitle + RowConstants.defaultLeftIconWidth
            + RowConstants.leadingSpaceForTitle).isActive = true
        }
    }

    /// Changing bottomAnchor constraints on floatingRowView.
    private func updateFloatingRowBottomConstraints() {
        if isShadowEnabled {
            floatingRowView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,
            constant: RowConstants.bottomSpace).isActive = true
        } else {
            floatingRowView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor,
            constant: RowConstants.zero).isActive = true
        }
    }

    /// Update floating row for current indexpath
    /// - Parameters:
    ///   - rowContent: Row Data to be updated
    ///   - type: type of floating row required
    public func setupCell(with rowContent: RowData, type: RowType) {
        floatingRowView.setupDefaultRowIcon(with: rowContent, rowType: type)
    }

    /// This is to update floating row view selected state
    /// - Parameter selected: true for selection and false fo deselecting the view
    public func didSelectFloatingRow(selected: Bool) {
        floatingRowView.didSelectRow(set: selected)
    }

}
