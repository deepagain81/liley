//
//  StatusHeaderInterface.swift
//  AllstateUIKit
//
//  Created by Jayaveeran, Saranya (INFOSYS) on 05/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import Foundation

public protocol StatusView where Self: UIView {
    func setStatusDelegate(as delegate: StatusDelegateProtocol)
    func reloadStatusView(with data: StatusHeaderData)
}

public protocol StatusDelegateProtocol: class {
    func didPressStatusView()
}
