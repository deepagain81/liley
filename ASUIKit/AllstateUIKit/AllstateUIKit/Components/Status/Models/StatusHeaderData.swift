//
//  StatusHeaderData.swift
//  AllstateUIKit
//
//  Created by Jayaveeran, Saranya (INFOSYS) on 05/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import Foundation

//The Status Data Model is constructed based on the elements required to construct the status types defined
//in the current requirement. If layout changes this needs to revisted.

public struct StatusHeaderData {
    var statusInfo: StatusInfo?
    public init(with statusType: StatusType, statusMessageText: String, statusHeaderType: StatusHeaderType) {
        statusInfo = StatusInfo(statusType: statusType,
                                statusMessageText: statusMessageText,
                                statusHeaderType: statusHeaderType)
    }
}

struct StatusInfo {
    var statusType: StatusType?
    var statusMessageText: String?
    var statusHeaderType: StatusHeaderType?
}
