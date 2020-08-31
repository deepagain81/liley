//
//  OverviewHeaderViewController.swift
//  AllstateUIKit-DemoApp
//

import UIKit
import AllstateUIKit

class OverviewHeaderViewController: UIViewController {
    @IBOutlet private weak var contentScrollView: UIScrollView!
    @IBOutlet private weak var stackHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var overviewHeaderTileView: OverviewHeader!
    @IBOutlet private weak var stackView: UIStackView!
    private var initialStackHeight: CGFloat?
    private var overviewTiles: NavigationHeaderView!
    private var button: UIButton!
    // MARK: - Local constants
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ASTheme.color.background
        contentScrollView.delegate = self
        self.navigationController?.setNavigationBarAttributes()
        setupQuickAccessTile()
        button = UIButton(frame: CGRect(x: 0, y: 10, width: 44, height: 44))
        button.addSubview(setSubTitle(subtitle: "Good \(convertDateToDay()), John"))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        self.navigationItem.title = "Header"
    }

    //Configure Quick Access Tile
    func setupQuickAccessTile() {
        guard let quickAccessimage = UIImage(named: "quickAccessPicture") else {
            return
        }
        let tile1 = TileData(image: quickAccessimage, messages: ["ROAD\nSIDE", "Sample text"])
        let tile2 = TileData(image: quickAccessimage, messages: ["ID\nCARDS", "Sample text"])
        let tile3 = TileData(tileID: "3", image: quickAccessimage, messages: ["HELP\nCENTER", "Sample text"], badgeCount: 5)
        let navigationData = NavigationBarInfo(leftTile: tile1, middleTile: tile2, rightTile: tile3, userName: "John")
        overviewTiles = navigationBuilder.create(with: navigationData, type: .overviewHeader)
        overviewTiles.setTileDelegate(as: self)
        stackView.addArrangedSubview(overviewTiles)
        stackHeightConstraint.constant = overviewTiles.calculateInitialViewConstraints(
            navigationController: self.navigationController!)
        initialStackHeight = stackHeightConstraint.constant
        let overviewTile = overviewTiles as? OverviewHeader
        overviewTile!.addBadgeOnTile(with: tile3)
    }

    //Configure style for sub title
    func setSubTitle(subtitle: String) -> UIView {
        let subTitleLabel = UILabel(frame: CGRect(x: 0, y: 10, width: 0, height: 22))
        subTitleLabel.text = subtitle
        subTitleLabel.textColor = UIColor.primaryDeepBlue
        subTitleLabel.font = ASTheme.font.body
        subTitleLabel.textAlignment = .left
        subTitleLabel.sizeToFit()
        return subTitleLabel
    }
}
extension OverviewHeaderViewController: TileDelegate {
    //set the action on  clicking the tile
    func onTilePress(tileID: String) {
        let alert = UIAlertController(title: "Alert",
                                      message: "This is Tile \(tileID) event.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}
extension OverviewHeaderViewController {
    fileprivate func convertDateToDay() -> String {
        let date = NSDate()
        var convertedDate: String = ""
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date as Date)
        if hour >= 0 && hour < 12 {
            convertedDate = "Morning"
        } else if hour >= 12 && hour < 16 {
            convertedDate = "Afternoon"
        } else {
            convertedDate = "Evening"
        }
        return convertedDate
    }
}

extension OverviewHeaderViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let navigationController = self.navigationController {
            stackHeightConstraint.constant = overviewTiles.calculateScrollHeightConstraints(navigationController:
                navigationController)
        }
        if initialStackHeight! > stackHeightConstraint.constant {
            self.navigationItem.leftBarButtonItem = nil
            self.navigationItem.setHidesBackButton(true, animated: true)
        } else if initialStackHeight! < stackHeightConstraint.constant {
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
