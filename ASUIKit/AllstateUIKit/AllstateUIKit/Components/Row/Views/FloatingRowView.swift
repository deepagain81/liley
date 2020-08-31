//
//  FloatingRowView.swift
//  AllstateUIKit-Apple

import UIKit

@IBDesignable public class FloatingRowView: RowBaseView {
    // MARK: - Outlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var baseStackView: UIStackView!
    @IBOutlet private weak var logoStackView: UIStackView!
    @IBOutlet private weak var allstatelogoImageView: UIImageView!
    @IBOutlet private weak var titleStackView: UIStackView!
    @IBOutlet private weak var subHeadLineLabel: UILabel!
    @IBOutlet private weak var footNoteLabel: UILabel!
    @IBOutlet private weak var informationStackView: UIStackView!
    @IBOutlet private weak var alertIconImageView: UIImageView!
    @IBOutlet private weak var informationNoteLabel: UILabel!
    @IBOutlet private weak var titleDetailsStackView: UIStackView!
    @IBOutlet private weak var subheadlineDataLabel: UILabel!
    @IBOutlet private weak var disclosureImageView: UIImageView!
    @IBOutlet private weak var informationalAndHighPriorityBaseView: UIView!
    @IBOutlet private weak var seperatorLineView: UIView!
    // MARK: - Local variables
    private let nibName = "FloatingRow"
    private weak var rowDelegate: RowDelegate?
    private var rowType: RowType = .multiSource
    private var rowData: RowData?
    private var multiSourceBool = Bool()
    // MARK: - Constants
    private struct RowConstant {
        static let shadowOpacityValue: Float = 1.0
        static let shadowRadiusValue: CGFloat = 3.0
        static let shadowOffsetWidth: CGFloat = 0.0
        static let shadowOffsetHeight: CGFloat = 2.0
        static let shadowValueNil: CGFloat = 0.0
        static let numberOfTaps: Int = 1
    }
    // MARK: - Test Result Bool
    public var isFloatingRowCreationFailed = Bool()
    // MARK: - ------- To load from the nib -------
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.nibSetup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.nibSetup()
    }
    /// The nibSetup function is used to sertup the frame of the contentView .
    func nibSetup() {
        backgroundColor = .clear

        if let nibView = loadViewFromNib() {
            contentView = nibView
            contentView.frame = bounds
            contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            contentView.translatesAutoresizingMaskIntoConstraints = false
            addSubview(contentView)
            contentView.translatesAutoresizingMaskIntoConstraints = false
            contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
            contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
            contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            setUpView()
        }
    }
    /// The loadViewFromNib function is used to return FloatingRowView.xib in form of UIView .
    private func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let nibView = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return nibView
    }
    // MARK: - ------- Floating Row UI functions -------
    /// Setting up appearance for Floating Row
    private func setUpView() {
        self.backgroundColor = .white
        self.autoresizingMask = [ .flexibleHeight, .flexibleWidth ]
        self.layoutIfNeeded()
        setFRviewColor(isHighlighted: false)
        setTextColor()
        setfont()
    }
    /// The setTextColor is used to set the textColor for the labels in the view .
    private func setTextColor() {
        subHeadLineLabel.textColor = UIColor.grey7
        footNoteLabel.textColor = UIColor.grey5
        informationNoteLabel.textColor = UIColor.grey7
        subheadlineDataLabel.textColor = UIColor.primaryDeepBlue
    }
    /// The setfont is used to set the font for the labels in the view .
    private func setfont() {
        subHeadLineLabel.font = ASTheme.font.headline
        footNoteLabel.font = ASTheme.font.footnote
        informationNoteLabel.font = ASTheme.font.footnote
        subheadlineDataLabel.font = ASTheme.font.rowLabelFont
    }
    /// The setFRviewColor is used to set and remove the bottom shadow to the view using a bool .
    /// - Parameter isHighlighted: When the bool is true the background color changes for the contentView and
    ///  removeBottomShadow() functiuon is called . When the bool is false the background color changes
    ///  for the contentView and setBottomShadow() functiuon is called .
    private func setFRviewColor(isHighlighted: Bool) {
        if isHighlighted == true {
            contentView.backgroundColor = UIColor.greyShadow
            contentView.removeBottomShadow()
        } else {
            contentView.backgroundColor = UIColor.white
            setBottomShadow()
        }
    }
    /// Set up Border Shadow for Floating Row
    private func setBottomShadow() {
        self.layer.masksToBounds = false
        self.layer.shadowRadius = RowConstant.shadowRadiusValue
        self.layer.shadowOpacity = RowConstant.shadowOpacityValue
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: RowConstant.shadowOffsetWidth,
                                         height: RowConstant.shadowOffsetHeight )
    }
    // MARK: - ------- Configure rows -------
    /// Configuring the data model values and row type to a common
    /// variable and passing it to the setFloatingRow function
    /// - Parameter data: The model ASRowData are passed .
    /// - Parameter floatingRowType: The RowType is passed .
    public func configure(data: RowData?, floatingRowType: RowType) {
            if let fetchedRowData: RowData = data {
                self.rowData = fetchedRowData
                self.rowType = floatingRowType
                setFloatingRow(ofType: floatingRowType, data: fetchedRowData)
                isFloatingRowCreationFailed = false
            } else {
                isFloatingRowCreationFailed = true
            }
    }
    /// Setting up Floating Row with the Row Type
    /// - Parameter ofType: The RowType is passed .
    /// - Parameter data: The model ASRowData are passed .
    private func setFloatingRow(ofType: RowType, data: RowData) {
        switch ofType {
        case .multiSource:
            loadMultiSourceRow(data: data)
        case .informational:
            loadInformationalRow(data: data)
        case .highPriority:
            loadHighPriorityRow(data: data)
        case .idCard:
            loadIDCardRow(data: data)
        default:
            return
        }
    }
    /// Loading MultiSource View with data .
    /// - Parameter data: The model ASRowData are passed .
    private func loadMultiSourceRow(data: RowData) {
        logoStackView.isHidden = true
        informationStackView.isHidden = true
        informationalAndHighPriorityBaseView.isHidden = true
        multiSourceBool = true
        setTitleForLabels(data: data)
    }
    /// Loading Informational View with data
    /// - Parameter data: The model ASRowData are passed .
    private func loadInformationalRow(data: RowData) {
        logoStackView.isHidden = true
        seperatorLineView.isHidden = true
        multiSourceBool = false
        setTitleForLabels(data: data)
        if let infoAndHiPriText = data.informationalAndHiPriNoteLabelTitle {
            informationNoteLabel.text = infoAndHiPriText
        }
        if let alertInfoImage = data.iconImageForAlertInfo {
            alertIconImageView.image = alertInfoImage
        }
        informationalAndHighPriorityBaseView.backgroundColor = UIColor.blueTint
    }
    ///Loading High Priority View with data
    /// - Parameter data: The model ASRowData are passed .
    private func loadHighPriorityRow(data: RowData) {
        logoStackView.isHidden = true
        seperatorLineView.isHidden = true
        informationalAndHighPriorityBaseView.backgroundColor = .red
        multiSourceBool = false
        setTitleForLabels(data: data)
        if let infoAndHiPriText = data.informationalAndHiPriNoteLabelTitle {
            informationNoteLabel.text = infoAndHiPriText
        }
        if let alertInfoImage = data.iconImageForAlertInfo {
            alertIconImageView.image = alertInfoImage
        }
        informationalAndHighPriorityBaseView.backgroundColor = UIColor.pinkTint
    }
    /// Loading Id Card View with data
    /// - Parameter data: The model ASRowData are passed .
    private func loadIDCardRow(data: RowData) {
        informationStackView.isHidden = true
        informationalAndHighPriorityBaseView.isHidden = true
        multiSourceBool = false
        if let allStateImage = data.allStateIconImage {
            allstatelogoImageView.image = allStateImage
        }
        setTitleForLabels(data: data)
    }
    /// Set Floating Row Label Title.
    /// - Parameter data: The model ASRowData are passed .
    private func setTitleForLabels(data: RowData) {
        if let subheadlineTopLabelText = data.subheadlineTopLabelTitle {
            subHeadLineLabel.text = subheadlineTopLabelText
        }
        if let footNoteViewLabelText = data.footNoteViewLabelTitle {
            footNoteLabel.text = footNoteViewLabelText
        }
        if let subheadlineBottomLabelText = data.subheadlineBottomLabelTitle {
            subheadlineDataLabel.text = subheadlineBottomLabelText
        }
        if let disclosureImage = data.disclosureImageView {
            disclosureImageView.image = disclosureImage
        }
    }
    // MARK: - ------- Interface functions -------
    /// Adding Tap Gesture for Floating Row
    private func addTapGesture() {
        let contentViewTapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        contentViewTapGesture.numberOfTapsRequired = RowConstant.numberOfTaps
        self.addGestureRecognizer(contentViewTapGesture)
    }
    /// Tap Gesture Tap Action
    @objc func tapAction(recognizer: UITapGestureRecognizer) {
        rowDelegate?.didPressRow(tag: self.rowData?.rowUniqueId ?? "")
        setFRviewColor(isHighlighted: false)
    }
    // MARK: - ---- Highlighted Setup -------
    /// When ther view  touch began this function is called .
    /// - Parameter touches: Default native touch .
    /// - Parameter event: Default native event .
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        setFRviewColor(isHighlighted: true)
    }
    /// When ther view  touche ends this function is called .
    /// - Parameter touches: Default native touch .
    /// - Parameter event: Default native event .
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        setFRviewColor(isHighlighted: false)
    }
    /// This is delegate method RowDelegate .
    override public func setRowDelegate(as delegate: RowDelegate) {
        rowDelegate = delegate
        addTapGesture()
    }
    /// This function reloadRow is used to reload (i.e) refresh the row .
    /// - Parameter data: The model ASRowData are passed .
    override public func reloadRow(with data: RowData) {
        //Refresh UI
        setFloatingRow(ofType: self.rowType, data: data)
    }
    /// This function changeRowType is used to change the row type .
    /// - Parameter type: The RowType is passed .
    override public func changeRowType(to type: RowType) {
        self.rowType = type
    }
    /// overridden to provide custom behavior when the environment's traits change. .
    /// - Parameter previousTraitCollection: previousTraitCollection
    override public func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if previousTraitCollection?.preferredContentSizeCategory != traitCollection.preferredContentSizeCategory {
            self.setfont()
            setFRviewColor(isHighlighted: false)
        }
    }
}
