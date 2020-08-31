//
//  StatusHeaderViewController.swift
//  AllstateUIKit-DemoApp
//
//  Created by Jayaveeran, Saranya (INFOSYS) on 04/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import UIKit
import AllstateUIKit

class StatusHeaderViewController: UIViewController {

    @IBOutlet weak private var statusView: StatusHeaderView!
    @IBOutlet weak private var statusViewPriority: StatusHeaderView!
    @IBOutlet weak private var statusViewInfo: StatusHeaderView!
    @IBOutlet weak private var statusViewSuccess: StatusHeaderView!
    @IBOutlet weak private var statusViewDisclosure: StatusHeaderView!
    @IBOutlet weak private var statusViewDisclosurePriority: StatusHeaderView!
    @IBOutlet weak private var statusViewDisclosureInfo: StatusHeaderView!
    @IBOutlet weak private var statusViewDisclosureSuccess: StatusHeaderView!
    @IBOutlet weak private var statusViewDismiss: StatusHeaderView!
    @IBOutlet weak private var statusViewDismissPriority: StatusHeaderView!
    @IBOutlet weak private var statusViewDismissInfo: StatusHeaderView!
    @IBOutlet weak private var statusViewDismissSuccess: StatusHeaderView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ASTheme.color.background
        setUpStatusView()
        setUpStatusViewDisclosure()
        setUpStatusViewDissmiss()
    }

    func setUpStatusView() {
        statusView.setStatusDelegate(as: self)
        statusViewPriority.setStatusDelegate(as: self)
        statusViewInfo.setStatusDelegate(as: self)
        statusViewSuccess.setStatusDelegate(as: self)
        let statusHeaderDataArray = getStatusData(with: .header)
        statusView.reloadStatusView(with: statusHeaderDataArray[0])
        statusViewPriority.reloadStatusView(with: statusHeaderDataArray[1])
        statusViewInfo.reloadStatusView(with: statusHeaderDataArray[2])
        statusViewSuccess.reloadStatusView(with: statusHeaderDataArray[3])
    }

    func setUpStatusViewDisclosure() {
        statusViewDisclosure.setStatusDelegate(as: self)
        statusViewDisclosurePriority.setStatusDelegate(as: self)
        statusViewDisclosureInfo.setStatusDelegate(as: self)
        statusViewDisclosureSuccess.setStatusDelegate(as: self)
        let statusDisclosureDataArray = getStatusData(with: .disclosure)
        statusViewDisclosure.reloadStatusView(with: statusDisclosureDataArray[0])
        statusViewDisclosurePriority.reloadStatusView(with: statusDisclosureDataArray[1])
        statusViewDisclosureInfo.reloadStatusView(with: statusDisclosureDataArray[2])
        statusViewDisclosureSuccess.reloadStatusView(with: statusDisclosureDataArray[3])
    }

    func setUpStatusViewDissmiss() {
        statusViewDismiss.setStatusDelegate(as: self)
        statusViewDismissPriority.setStatusDelegate(as: self)
        statusViewDismissInfo.setStatusDelegate(as: self)
        statusViewDismissSuccess.setStatusDelegate(as: self)
        let statusDissmissDataArray = getStatusData(with: .dismiss)
        statusViewDismiss.reloadStatusView(with: statusDissmissDataArray[0])
        statusViewDismissPriority.reloadStatusView(with: statusDissmissDataArray[1])
        statusViewDismissInfo.reloadStatusView(with: statusDissmissDataArray[2])
        statusViewDismissSuccess.reloadStatusView(with: statusDissmissDataArray[3])
    }

    func getStatusData(with type: StatusType) -> [StatusHeaderData] {
        let statusData = StatusHeaderData(with: type,
                                          statusMessageText: "Source/Subheadline - Alert Message",
                                          statusHeaderType: .highPriority)
        let statusDataPriority = StatusHeaderData(with: type,
                                                  statusMessageText: "Source/Subheadline - Alert Message",
                                                  statusHeaderType: .priority)
        let statusDataInfo = StatusHeaderData(with: type,
                                              statusMessageText: "Source/Subheadline - Alert Message",
                                              statusHeaderType: .informational)
        let statusDataSuccess = StatusHeaderData(with: type,
                                                 statusMessageText: "Source/Subheadline - Alert Message",
                                                 statusHeaderType: .success)
        let statusArray = [statusData, statusDataPriority, statusDataInfo, statusDataSuccess]
        return statusArray
    }

    @IBAction func resetStatusView(_ sender: Any) {
        statusViewDisclosure.resetStatusView(with: .highPriority)
        statusViewDisclosurePriority.resetStatusView(with: .priority)
        statusViewDisclosureInfo.resetStatusView(with: .informational)
        statusViewDisclosureSuccess.resetStatusView(with: .success)
    }
}

extension StatusHeaderViewController: StatusDelegateProtocol {
    func didPressStatusView() {
    }
}

// MARK: StoryboardIdentifierProtocol
extension StatusHeaderViewController: StoryboardIdentifierProtocol {
    static var storyboardID: String {
        return "StatusHeaderViewController"
    }
}
