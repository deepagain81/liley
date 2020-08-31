//
//  StatusHeaderView.swift
//  AllstateUIKit
//
//  Created by Jayaveeran, Saranya (INFOSYS) on 04/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import UIKit

enum HeaderTag: Int {
    case disclosure = 0, dismiss, none
}
enum HeaderStatusTag: Int {
    case highPriority = 0, priority, info, success
}
public class StatusHeaderView: ASThemeableView, XibViewGettable {

    @IBOutlet weak private var rightImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak private var statusLabel: UILabel!
    @IBOutlet weak private var rightImageView: UIImageView!
    @IBOutlet weak private var leftImageView: UIImageView!
    private weak var delegate: StatusDelegateProtocol?
    private var contentView: UIView!

    // MARK: life Cycle Method
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
        nibSetup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        nibSetup()
    }

    // MARK: custom Methods to load and set nib
    private func nibSetup() {
        guard let nibview = loadViewFromNib()
            else { return }
        nibview.frame = self.bounds
        self.addSubview(nibview)
        contentView = nibview
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.autoresizingMask = [ .flexibleHeight, .flexibleWidth ]
        self.layoutIfNeeded()
    }

    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }
    // MARK: method to reset status view pressed state color on tap of disclosure arrow
    public func resetStatusView(with headerType: StatusHeaderType) {
        switch headerType {
        case .highPriority:
            self.contentView.backgroundColor = UIColor.pinkTint
        case .priority:
            self.contentView.backgroundColor = UIColor.yellowTint
        case .informational:
            self.contentView.backgroundColor = UIColor.blueTint
        case .success:
            self.contentView.backgroundColor = UIColor.greenTint
        }
    }
    // MARK: method to config status header view
    func config(_ data: StatusHeaderData) {
        //Setup the statusView
        configStatusHeader(with: data)

    }
    // MARK: method to setup status header view
    private func setUpStatusView () {
        addGesture()
        statusLabel.textColor = UIColor.grey7
        statusLabel.font = ASTheme.font.headline2
    }

    // MARK: Custom Method to addGesture for rightImageView
    private func addGesture() {
        rightImageView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.handleTap(_:)))
        let longPressRecognizer = UILongPressGestureRecognizer(target: self,
                                                               action: #selector(self.handleLongPress(_:)))
        longPressRecognizer.minimumPressDuration = 0.1
        longPressRecognizer.delaysTouchesBegan = true
        if rightImageView.tag == HeaderTag.disclosure.rawValue {
            contentView.addGestureRecognizer(tap)
            contentView.addGestureRecognizer(longPressRecognizer)
        } else {
            rightImageView.addGestureRecognizer(tap)
            rightImageView.addGestureRecognizer(longPressRecognizer)
        }
    }
    // MARK: Long Press Gesture action for rightImageView
    @IBAction private func handleLongPress(_ sender: UITapGestureRecognizer? = nil) {
        if rightImageView.tag == HeaderTag.disclosure.rawValue {
            if sender?.state != UIGestureRecognizer.State.ended {
                //When lognpress is start or running
                updatePressedState()
            } else {
                //When lognpress is finish
                delegate?.didPressStatusView()
            }
        } else {
            self.contentView.removeFromSuperview()
            self.removeFromSuperview()
        }
    }

    // MARK: Tap Gesture action for rightImageView
    @IBAction private func handleTap(_ sender: UITapGestureRecognizer? = nil) {
        switch rightImageView.tag {
        case HeaderTag.dismiss.rawValue:
            self.contentView.removeFromSuperview()
            self.removeFromSuperview()
        case HeaderTag.disclosure.rawValue:
            updatePressedState()
            delegate?.didPressStatusView()
        default:
            break
        }

    }
    // MARK: method to config status header view depends on status type and info
    private func configStatusView (with type: StatusType, statusHeaderType: StatusHeaderType) {
        switch type {
        case .header:
            rightImageView.isHidden = true
            rightImageView.tag = HeaderTag.none.rawValue
        case .disclosure:
            rightImageWidthConstraint.constant = 7.0
            rightImageView.isHidden = false
            rightImageView.tag = HeaderTag.disclosure.rawValue
            configDisclosureType(with: statusHeaderType)
        case .dismiss:
            rightImageWidthConstraint.constant = 12.0
            rightImageView.isHidden = false
            rightImageView.tag = HeaderTag.dismiss.rawValue
            configDismissType(with: statusHeaderType)
        }
        configStatusHeaderType(with: statusHeaderType)
    }
    // MARK: method to config status header view for dismiss
    private func configDismissType (with type: StatusHeaderType) {
        guard let closeHighPriorityImage = UIImage(named: ImageName.closeHighPriority,
                                                   in: Bundle(for: StatusHeaderView.self),
                                                   compatibleWith: nil),
            let closePriorityImage = UIImage(named: ImageName.closePriority,
                                             in: Bundle(for: StatusHeaderView.self),
                                             compatibleWith: nil),
            let closeInfoImage = UIImage(named: ImageName.closeInfo,
                                         in: Bundle(for: StatusHeaderView.self),
                                         compatibleWith: nil),
            let closeSuccessImage = UIImage(named: ImageName.closeSuccess,
                                            in: Bundle(for: StatusHeaderView.self),
                                            compatibleWith: nil)
            else { return }
        switch type {
        case .highPriority:
            rightImageView.image = closeHighPriorityImage
        case .priority:
            rightImageView.image = closePriorityImage
        case .informational:
            rightImageView.image = closeInfoImage
        case .success:
            rightImageView.image = closeSuccessImage
        }
    }
    // MARK: method to config status header view for disclosure
    private func configDisclosureType (with type: StatusHeaderType) {
        guard let disclosureHighPriorityImage = UIImage(named: ImageName.disclosureHighPriority,
                                                        in: Bundle(for: StatusHeaderView.self),
                                                        compatibleWith: nil),
            let disclosurePriorityImage = UIImage(named: ImageName.disclosurePriority,
                                                  in: Bundle(for: StatusHeaderView.self),
                                                  compatibleWith: nil),
            let disclosureInfoImage = UIImage(named: ImageName.disclosureInfo,
                                              in: Bundle(for: StatusHeaderView.self),
                                              compatibleWith: nil),
            let disclosureSuccessImage = UIImage(named: ImageName.disclosureSuccess,
                                                 in: Bundle(for: StatusHeaderView.self),
                                                 compatibleWith: nil)
            else { return }
        switch type {
        case .highPriority:
            rightImageView.image = disclosureHighPriorityImage
        case .priority:
            rightImageView.image = disclosurePriorityImage
        case .informational:
            rightImageView.image = disclosureInfoImage
        case .success:
            rightImageView.image = disclosureSuccessImage
        }
    }
    // MARK: method to config status header view depends on status info
    private func configStatusHeaderType (with type: StatusHeaderType) {
        guard let highPriorityImage = UIImage(named: ImageName.statusHighPriority,
                                              in: Bundle(for: StatusHeaderView.self),
                                              compatibleWith: nil),
            let priorityImage = UIImage(named: ImageName.statusPriority,
                                        in: Bundle(for: StatusHeaderView.self),
                                        compatibleWith: nil),
            let infoImage = UIImage(named: ImageName.statusInfo,
                                    in: Bundle(for: StatusHeaderView.self),
                                    compatibleWith: nil),
            let successImage = UIImage(named: ImageName.statusSucess,
                                       in: Bundle(for: StatusHeaderView.self),
                                       compatibleWith: nil)
            else { return }
        switch type {
        case .highPriority:
            self.contentView.backgroundColor = UIColor.pinkTint
            self.contentView.tag = HeaderStatusTag.highPriority.rawValue
            leftImageView.image = highPriorityImage
        case .priority:
            self.contentView.backgroundColor = UIColor.yellowTint
            self.contentView.tag = HeaderStatusTag.priority.rawValue
            leftImageView.image = priorityImage
        case .informational:
            self.contentView.backgroundColor = UIColor.blueTint
            self.contentView.tag = HeaderStatusTag.info.rawValue
            leftImageView.image = infoImage
        case .success:
            self.contentView.backgroundColor = UIColor.greenTint
            self.contentView.tag = HeaderStatusTag.success.rawValue
            leftImageView.image = successImage
        }
    }
    // MARK: method to get status message text
    func getStatusLabelText() -> String {
        return statusLabel.text ?? ""
    }
    // MARK: method to update pressed state color
    func updatePressedState () {
        switch contentView.tag {
        case HeaderStatusTag.highPriority.rawValue:
            self.contentView.backgroundColor = UIColor.redTintDark
        case HeaderStatusTag.priority.rawValue:
            self.contentView.backgroundColor = UIColor.yellowTintDark
        case HeaderStatusTag.info.rawValue:
            self.contentView.backgroundColor = UIColor.blueTintDark
        case HeaderStatusTag.success.rawValue:
            self.contentView.backgroundColor = UIColor.greenTintDark
        default:
        break
        }
    }
    // MARK: method to config status header view
    fileprivate func configStatusHeader(with statusHeaderdata: StatusHeaderData) {
        guard let statusType = statusHeaderdata.statusInfo?.statusType
            else { return }
        guard let statusHeaderType = statusHeaderdata.statusInfo?.statusHeaderType
            else { return }
        configStatusView(with: statusType, statusHeaderType: statusHeaderType)
        statusLabel.text = statusHeaderdata.statusInfo?.statusMessageText
        setUpStatusView()
    }
}
// MARK: statusView needs to adhere to StatusDelegateProtocol to provide the user facing functions on status view
extension StatusHeaderView: StatusView {
    public func setStatusDelegate(as delegate: StatusDelegateProtocol) {
        self.delegate = delegate
    }
    public func reloadStatusView(with data: StatusHeaderData) {
        configStatusHeader(with: data)
    }

}
