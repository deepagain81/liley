//
//  StatusBuilderProtocol.swift
//  AllstateUIKit
//
//  Created by Jayaveeran, Saranya (INFOSYS) on 05/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import Foundation

///Status Type would determine the status header style
public enum StatusType: String {
    case header
    case disclosure
    case dismiss
}
///Status header Type would determine the status header information
public enum StatusHeaderType: String {
    case priority
    case highPriority
    case informational
    case success
}
//Protocol to guide the class which would build the Status header component.
//Here we can define functions which are required by the framework's consumer for constructing status header component
//External enties of the framework will not have direct access to the component builder.
public protocol StatusBuilderProtocol {

    /// Method to create status header view
    /// - Parameter statusHeaderData: data should contain status type, status text and status info type
    func create(with statusHeaderData: StatusHeaderData) -> StatusView
}
