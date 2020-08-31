//
//  BottomSheetViewController.swift
//  AllstateUIKit-DemoApp

import UIKit
import AllstateUIKit

class BottomSheetViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.frame = UIApplication.shared.windows.first?.frame ?? CGRect()
        let agentSearchController = sheetBuilder.create(with: self)
        agentSearchController.view.setDropShadow()
        self.navigationController?.isNavigationBarHidden = true
    }
}
