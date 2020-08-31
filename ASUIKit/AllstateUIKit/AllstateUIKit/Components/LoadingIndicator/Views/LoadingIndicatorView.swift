//
//  LoadingIndicatorView.swift
//  AllstateUIKit
//

import UIKit

public class LoadingIndicatorView: UIView, XibViewGettable {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var loadingIndicatorView: UIView!
    @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var messageLabel: UILabel!

    public static let loaderDefaultMessage =
        "LOADING_INDICATOR_DEFAULT_MESSAGE".localized(in: Bundle(for: LoadingIndicatorView.self))

    var loaderMessage: String? {
        didSet {
            messageLabel.text = self.loaderMessage
        }
    }

    // MARK: - ------- To load from the nib -------
    public override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initView()
    }

    private func initView() {
        let nib = LoadingIndicatorView.getNib()
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
        setUpInitialView()
    }

    // function to set up initial views
    private func setUpInitialView() {
        activityIndicator.color = ASTheme.color.primaryBackgroundColor
        messageLabel.textColor = ASTheme.color.buttonBlueTitle
        messageLabel.font = ASTheme.font.headline
        messageLabel.adjustsFontForContentSizeCategory = true
        loadingIndicatorView.dropShadow(top: false, left: false, bottom: true, right: true)
        activityIndicator.startAnimating()
    }
}
