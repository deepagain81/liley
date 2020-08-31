//
//  TileInCollectionViewController.swift
//  AllstateUIKit-DemoApp

import UIKit
import AllstateUIKit

//Agent Tile Date
struct AgentTileData {
    static let tileId = "1"
    static let imageName = "agentPicture"
    static let messege = "Alexandria Remo"
}

class TileInCollectionViewController: UIViewController {
    @IBOutlet weak var tileCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeightConstraint: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tileCollectionView.delaysContentTouches = false
    }

    func setCollectionViewHeight() {
        collectionViewHeightConstraint.constant
            = tileCollectionView.collectionViewLayout.collectionViewContentSize.height
        self.view.layoutIfNeeded()
    }
}

extension TileInCollectionViewController: UICollectionViewDataSource,
            UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "tileCell",
                                                         for: indexPath) as? TileCollectionViewCell {
            let tileData = TileData(tileID: AgentTileData.tileId,
                                    image: UIImage(named: AgentTileData.imageName), messages: [AgentTileData.messege])
            cell.agentTileButton.configureAgentTile(with: tileData)
            cell.agentTileButton.isAccessible = false
            return cell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 170, height: 88)
    }
}
