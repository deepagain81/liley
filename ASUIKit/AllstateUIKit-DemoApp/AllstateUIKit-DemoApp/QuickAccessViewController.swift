//
//  QuickAccessViewController.swift
//  AllstateUIKit-DemoApp
//

import UIKit
import AllstateUIKit

class QuickAccessViewController: UIViewController {
    @IBOutlet private weak var contentScrollView: UIScrollView!
    @IBOutlet private weak var stackHeightConstraint: NSLayoutConstraint!
    @IBOutlet private weak var stackView: UIStackView!
    private var overviewTiles: NavigationHeaderView!
    // MARK: - Local constants -
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ASTheme.color.background
        contentScrollView.delegate = self
        self.navigationController?.setNavigationBarAttributes()
        setupQuickAccessTile()
        self.navigationItem.title = "Header"
    }

    //setting up quickAccess Tiles
    func setupQuickAccessTile() {
        guard let quickAccessimage = UIImage(named: "quickAccessPicture") else {
            return
        }
        let tile1 = TileData(image: quickAccessimage, messages: ["ROAD\nSIDE", "Sample text"])
        let tile2 = TileData(image: quickAccessimage, messages: ["ID\nCARDS", "Sample text"])
        let tile3 = TileData(image: quickAccessimage, messages: ["HELP\nCENTER", "Sample text"])
        let navigationData = NavigationBarInfo(leftTile: tile1, middleTile: tile2, rightTile: tile3, userName: "John")
        overviewTiles = navigationBuilder.create(with: navigationData, type: .overviewHeader)
        overviewTiles.setTileDelegate(as: self)
        stackView.addArrangedSubview(overviewTiles)
        stackHeightConstraint.constant = overviewTiles.calculateInitialViewConstraints(
            navigationController: self.navigationController!)
    }
}

extension QuickAccessViewController: TileDelegate {
    //set the action on  clicking the tile
    func onTilePress(tileID: String) {
        let alert = UIAlertController(title: "Alert", message: "This is Tile \(tileID) event.",
                                              preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in }))
        self.present(alert, animated: true, completion: nil)
    }
}

extension QuickAccessViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if let navigationController = self.navigationController {
            stackHeightConstraint.constant = overviewTiles.calculateScrollHeightConstraints(navigationController:
                navigationController)
        }
    }
}
