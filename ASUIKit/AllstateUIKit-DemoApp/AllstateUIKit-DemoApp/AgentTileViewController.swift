//
//  AgentTileViewController.swift
//  AllstateUIKit-DemoApp
//

import UIKit
import AllstateUIKit

/// CellConstant struct holds the cell attribute values
struct CellConstants {
    static let height = 88
    static let width = 172
    static let zero = 0
}
/// Viewmodel for AgentTileCellTableViewController
struct AgentTileModel {
    var agentTileModelView: AgentTileCollectionViewCell?
    var tilDataModel: TileData!
    mutating func generateCell(for indexPath: IndexPath,
                               collectionview: UICollectionView) -> UICollectionViewCell {
        if agentTileModelView == nil {
            if let cell = collectionview.dequeueReusableCell(withReuseIdentifier:
                AgentTileCollectionViewCell.cellIdentifier, for: indexPath) as? AgentTileCollectionViewCell {
                cell.setUpAgentTileCell(with: tilDataModel)
                cell.setTileAction().tag = indexPath.row
                cell.setTileAction().addTarget(self, action: #selector(
                    AgentTileViewController.selectCollectionCell(_:)), for: .touchUpInside)
                return cell
            }
            let cell = AgentTileCollectionViewCell.init(frame: CGRect(x: CellConstants.zero, y:
                CellConstants.zero, width: CellConstants.width, height: CellConstants.height))
            self.agentTileModelView = cell
            return cell
        } else {
            return agentTileModelView ?? AgentTileCollectionViewCell()
        }
    }
}

class AgentTileViewController: UIViewController {
    // MARK: - Local variables
    private var agentArray = [["name": "Alexa\nCruze", "message": "Sample text", "image": "agentPicture"],
                    ["name": "Alexandria\nCruze", "message": "Sample text", "image": "agentPicture"],
                    ["name": "Alex\nCruze", "message": "Sample text", "image": "agentPicture"]]
    private var collectionViewContents = [AgentTileModel]()
    @IBOutlet private weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        ///setup delegate and data source for collection view
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(AgentTileCollectionViewCell.nib,
                                forCellWithReuseIdentifier: AgentTileCollectionViewCell.cellIdentifier)
        setupCollectionViewContent()
    }

    ///setup collection view 
    private func setupCollectionViewContent() {
        //generate AgentTileModel view array
        for item in 0..<(agentArray.count) {
            let tileData = TileData(tileID: "1", image: UIImage(named: agentArray[item]["image"] ?? ""),
            messages: [agentArray[item]["name"], agentArray[item]["message"]])
            collectionViewContents.append(AgentTileModel(agentTileModelView: nil, tilDataModel: tileData))
        }
    }

    @objc func selectCollectionCell(_ sender: UIButton) {
        print(sender.tag)
        let identifier = "MyAgentScreenViewController"
        guard let demoViewController = self.storyboard?.instantiateViewController(withIdentifier: identifier) else {
            // view controller not found or invalid storyboard identifier
            return
        }
        self.showDetailViewController(demoViewController, sender: self)
    }
}

extension AgentTileViewController: UICollectionViewDelegate,
UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // MARK: - Collection view Data Source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewContents.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
        -> UICollectionViewCell {
        var agentTileModel = collectionViewContents[indexPath.row]
        return agentTileModel.generateCell(for: indexPath, collectionview: collectionView)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt
        indexPath: IndexPath) -> CGSize {
        return CGSize(width: CellConstants.width, height: CellConstants.height)
    }
}
