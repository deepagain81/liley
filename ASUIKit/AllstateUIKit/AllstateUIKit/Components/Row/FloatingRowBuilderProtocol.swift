//
//  FloatingRowBuilderProtocol.swift
//  ASUIKit

import Foundation

/// Following enum contains types of rows, based on which the row layout and style would be configured.
public enum RowType: String {
    case defaultRowIcon
    case defaultRow
    case defaultVariationRow
    case defaultVariationRowIcon
    case multiSource
    case informational
    case highPriority
    case idCard
    case defaultVariationRowImage
}

public typealias OnRowClick = (_ rowTag: String) -> Void
//Protocol to guide the class which would build the rows.
//Here we can define functions which are required by the framework's consumer for constructing rows
//External enties of the framework will not have direct access to the component builder.
public protocol FloatingRowBuilderProtocol {
    // Style 1
    func create(with rowData: RowData, type: RowType, onClick: OnRowClick?) -> RowView
}
