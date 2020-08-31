//
//  FloatingRowInterface.swift
//  ASUIKit

import Foundation

//This defines the functions provided by the row view
//These are the functions which the framework's consumer would get to work on the Row View
//As well a way to set observer for the action callbacks on the Floating row View
public protocol RowView where Self: UIView {
    //Register as row delegate only if intereseted in tapping in to the user action on Floating Row View
    //or some callsbacks from the RowView
    func setRowDelegate(as delegate: RowDelegate)
    func changeRowType(to type: RowType)
    func reloadRow(with data: RowData)
}

//This protocol represents the actions or callbacks from the Floating Row View to the consumer.
public protocol RowDelegate: class {

    func didPressRow(tag: String)
}
