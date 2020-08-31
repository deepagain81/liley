//
//  TileViewController.swift
//  AllstateUIKit-DemoApp

import UIKit
import Foundation
import AllstateUIKit
class TileViewController: UIViewController {

  @IBOutlet weak var quickAccessStackView: UIStackView!
  @IBOutlet weak var agentStackView: UIStackView!
  @IBOutlet weak var idCardStackView: UIStackView!
  @IBOutlet weak var promoStackView: UIStackView!
  private var badgeOne: Badge?
  private var badgeTwo: Badge?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = ASTheme.color.background
        setupQuickAccessTile()
        setupAgentTile()
        setupIDCardTile()
        setupPromoTile()
        // Do any additional setup after loading the view.
        badgeOne = Badge(view: quickAccessStackView, position: .topRight)
        badgeOne?.updateBadgeCount(4)
        badgeTwo = Badge(view: idCardStackView, position: .topRight)
        badgeTwo?.updateBadgeCount(10)
    }
    /// To adjust collection view height according to the content
   func setupQuickAccessTile() {
    guard let quickAccessimage = UIImage(named: "quickAccessPicture") else {
                return
            }
            //Preparing data for tile
            let quickAccesstileData = TileData(tileID: "1", image: quickAccessimage,
                                        messages: ["Digital\nLocker", "Sample text"])
            //Creation type1: Quick Access tile
            let quickAccesstileView = tileBuilder.createTileButton(with: quickAccesstileData, type: .quickAccess)
            quickAccesstileView.addTarget(self, action: #selector(tileClickAction), for: .touchUpInside)
            quickAccessStackView.addArrangedSubview(quickAccesstileView)
    }
    func setupAgentTile() {
      guard let agentimage = UIImage(named: "agentPicture") else {
                  return
              }
              //Preparing data for tile
              let agentTileData = TileData(tileID: "2", image: agentimage,
                                    messages: ["Alexandria\nCruze", "Sample text"])
              //Creation type2: Agent tile
              let agenttileView = tileBuilder.createTileButton(with: agentTileData, type: .agent)
              agenttileView.addTarget(self, action: #selector(tileClickAction), for: .touchUpInside)
              agentStackView.addArrangedSubview(agenttileView)
    }
    func setupIDCardTile() {
      guard let idCardimage = UIImage(named: "idCardPicture") else {
                  return
              }
              //Preparing data for tile
              let idCardtileData = TileData(tileID: "3", image: idCardimage,
                                    messages: ["2019\nRANGE ROVER\nLAND ROVER", "Sample text"])
              //Creation type3: ID Card tile
              let idCardtileView = tileBuilder.createTileButton(with: idCardtileData, type: .idCard)
              idCardtileView.addTarget(self, action: #selector(tileClickAction), for: .touchUpInside)
              idCardStackView.addArrangedSubview(idCardtileView)
    }
    func setupPromoTile() {
      guard let promoImage = UIImage(named: "promoPicture") else {
                  return
              }
              //Preparing data for tile
              let promotileData = TileData(tileID: "4", image: promoImage,
                                          messages: ["FPO", "Heading", "Message"])
              //Creation type4: Promo tile
              let promotileView = tileBuilder.createTileButton(with: promotileData, type: .promo)
              promotileView.addTarget(self, action: #selector(tileClickAction), for: .touchUpInside)
              promoStackView.addArrangedSubview(promotileView)
    }
    @objc func tileClickAction() {
        let alert = UIAlertController(title: "Alert",
                                      message: "This is Tile click event.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension TileViewController: StoryboardIdentifierProtocol {
    static var storyboardID: String {
        return "TileViewController"
}
}
