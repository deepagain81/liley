//
//  UIKitDemoViewController.swift
//  AllstateUIKit-DemoApp
//

import UIKit
import AllstateUIKit

class UIKitDemoViewController: UIViewController {
    @IBOutlet weak var stackView: UIStackView!
    override func viewDidLoad() {
        // setting theme
        self.view.backgroundColor = ASTheme.color.background
        setupFloatingRows()
    }

    func setupFloatingRows() {
        for component in SharedConstants.allUIComponents {
            let rowData = RowData(rowTag: component.rawValue,
                                        title: component.title,
                                        subtitle: component.subTitle,
                                        leftIcon: component.leftIcon,
                                        rightIcon: component.rightIcon)

            let rowView = floatingRowBuilder.create(with: rowData, type: .defaultRow, onClick: nil)
            rowView.setRowDelegate(as: self)
            stackView.addArrangedSubview(rowView)
        }
    }
}

extension UIKitDemoViewController: RowDelegate {
    func didPressRow(tag: String) {
        guard let component = SharedConstants.UIComponent(rawValue: tag) else {
            // invalid component
            return
        }
        guard let identifier = component.storyboardIdentifier else {
            return
        }
        guard let demoViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
            // view controller not found or invalid storyboard identifier
            return
        }
        // force wrap navigation contoller, it must exists,
        self.navigationController!.pushViewController(demoViewController, animated: true)
    }
}
