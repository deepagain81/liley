//
//  MyAgentScreenViewController.swift
//  AllstateUIKit-DemoApp
//

import UIKit

struct Constraints {
    static let xAxis = 300
    static let yAxis = 10
    static let width = 50
    static let height = 20
}
///View controller with close buttom
class MyAgentScreenViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpCloseButton()
    }

    //setup Close Button
    fileprivate func setUpCloseButton() {
        let close = UIButton(frame: CGRect(x: Constraints.xAxis, y: Constraints.yAxis,
                                           width: Constraints.width, height: Constraints.height))
        close.setTitle("Close", for: .normal)
        close.backgroundColor = .black
        close.addTarget(self, action: #selector(closeAction), for: .allEvents)
        self.view.addSubview(close)
    }

    @objc func closeAction() {
        self.dismiss(animated: true, completion: nil)
    }
}
