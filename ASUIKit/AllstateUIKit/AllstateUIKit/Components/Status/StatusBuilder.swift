//
//  StatusBuilder.swift
//  AllstateUIKit
//
//  Created by Jayaveeran, Saranya (INFOSYS) on 05/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import Foundation

///The class that builds the various types of status
class StatusBuilder: StatusBuilderProtocol {

    /// Method to create status header view
    /// - Parameter statusHeaderData: data should contain status type, status text and status info type
    func create(with statusHeaderData: StatusHeaderData) -> StatusView {
        return getStatusHeader(with: statusHeaderData)
    }

}

extension StatusBuilder {

    /// Method to get status header view
    /// - Parameter data: data should contain status type, status text and status info type
    private func getStatusHeader(with data: StatusHeaderData ) -> StatusHeaderView {
        let statusView = StatusHeaderView()
        statusView.config(data)
        return statusView
    }
}
