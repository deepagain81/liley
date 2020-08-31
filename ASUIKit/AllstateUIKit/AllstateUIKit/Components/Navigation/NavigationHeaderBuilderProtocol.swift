//
//  NavigationHeaderBuilderProtocol.swift
//  ASUIKit
//
//

import Foundation

///Declaring the types of navigation header
public enum NavigationHeaderType: String {
    case quickAccess
    case overviewHeader
    case featureSummaryDefault
    case featureSummarySegmentedControl
    case featureSummarySegmentedControlStatusRow
}

//Protocol to guide the class which would build the tiles.
//Here we can define functions which are required by the framework's consumer for constructing tile
//External enties of the framework will not have direct access to the component builder.

///Protocol with create function, which returns NavigationHeaderView object
public protocol NavigationHeaderBuilderProtocol {
    func create(with navigationData: NavigationBarInfo, type: NavigationHeaderType) -> NavigationHeaderView
}
