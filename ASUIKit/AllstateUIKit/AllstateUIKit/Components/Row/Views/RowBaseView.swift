//
//  RowBaseView.swift
//  AllstateUIKit

import Foundation

// This class is used as a base class for RowAsView which inherits from ASThemeableView, XibViewGettable, RowView

public class RowBaseView: ASThemeableView, XibViewGettable, RowView {
    public var clickCompletion: OnRowClick?
    // This is used to set delegate methods for the rowcomponents
    public func setRowDelegate(as delegate: RowDelegate) {}
    // This is used to change the row type (e.g default row or default row icon)
    public func changeRowType(to type: RowType) {}
    // This is used to reload the row with new data
    public func reloadRow(with data: RowData) {}
}
