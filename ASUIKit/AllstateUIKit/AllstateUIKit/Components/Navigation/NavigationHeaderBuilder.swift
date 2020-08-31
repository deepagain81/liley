//
//  NavigationHeaderBuilder.swift
//  ASUIKit
//
//

import Foundation

final class NavigationHeaderBuilder: NavigationHeaderBuilderProtocol {
    func create(with info: NavigationBarInfo, type: NavigationHeaderType) -> NavigationHeaderView {
        return createAndConfigNavigationItem(with: info, type: type)
    }
}

extension NavigationHeaderBuilder {
//Call the funtions to load the view wrt navigation header type.
    private func createAndConfigNavigationItem(with info: NavigationBarInfo, type: NavigationHeaderType)
        -> NavigationHeaderBaseView {
        switch type {
        case .overviewHeader, .quickAccess:
                return getOverviewHeader(with: info, type: type)
        case .featureSummaryDefault, .featureSummarySegmentedControl, .featureSummarySegmentedControlStatusRow:
                return getFeatureSummaryNavigation(with: info, type: type)
        }
  }
//Currently the the different navigation bar have been created out of same class "NavigationBar as View"
//This is becuase the UI is simple and could be adjusted slightly to get three variations
//In case the navigation bar layouts are completely different we can maintain different View classes
//(along with respective NIB files) to keep it simple.

    //Returns the view for overviewHeader and Quickaccess as per the type
    private func getOverviewHeader(with data: NavigationBarInfo, type: NavigationHeaderType)
        -> NavigationHeaderBaseView {
        let overviewNavigationHeader = OverviewHeader()
        overviewNavigationHeader.configureOverviewHeader(with: data, type: type)
        return overviewNavigationHeader
    }
    //Returns the view for Feature Summary variations
    private func getFeatureSummaryNavigation(with data: NavigationBarInfo,
                                             type: NavigationHeaderType) -> NavigationHeaderBaseView {
        let defaultHeaderNavigation = NavigationBarView()
        defaultHeaderNavigation.configureFeatureSummaryHeader(with: data, type: type)
        return defaultHeaderNavigation
    }
}
