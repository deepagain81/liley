//
//  AgentFloatingRowCell.swift
//  AllstateUIKit

import UIKit

final public class AgentFloatingRowView: RowBaseView {

    // MARK: - Outlets
    @IBOutlet private weak var agentImageView: UIImageView!
    @IBOutlet private  weak var titleLabelOulet: UILabel!
    @IBOutlet private weak var subtitleLabelOutlet: UILabel!
    @IBOutlet private weak var disclosureImageView: UIImageView!
    @IBOutlet weak var agentImageContainerView: UIView!
    var contentView: UIView!
    let nibName = "AgentFloatingRowView"
    public var isShadowEnabled = true
    // enum for all constants
    private enum RowConstants {
        static let zero: CGFloat = 0.0
        static let bottomSpace: CGFloat = -8.0
        static let leftIconWidth: CGFloat = 24.0
        static let leadingSpaceForTitle: CGFloat = 16.0
        static let shadowRadius: CGFloat = 3.0
        static let shadowOpacity: CGFloat = 1
        static let shadowHeight: CGFloat = 2
        static let subtitleWidth: CGFloat = 86.0
    }

    // MARK: - Local Variables
    private var rowType: RowType = .defaultVariationRowImage
    private var rowData: RowData?
    private var isViewHighlighted = false
    //Action handlers
    private weak var rowDelegate: RowDelegate?
    private var tapGestureRecognizer: UITapGestureRecognizer!

    // Getter,setters for data
    public var title: String {
        get { return titleLabelOulet.text ?? "" }
        set { titleLabelOulet.text = newValue }
    }

    public var subtitle: String {
        get { return subtitleLabelOutlet.text ?? "" }
        set { subtitleLabelOutlet.text = newValue }
    }

    public var agentImage: UIImage {
        get { return agentImageView.image ?? UIImage() }
        set { agentImageView.image = newValue }
    }

    public var disclosureImage: UIImage {
        get { return disclosureImageView.image ?? UIImage() }
        set { disclosureImageView.image = newValue }
    }

    public var allowTapGesture: Bool {
        set { tapGestureRecognizer.isEnabled = newValue }
        get { return tapGestureRecognizer.isEnabled }
    }

    // MARK: - ------- To load from the nib -------
      public override init(frame: CGRect) {
          // For use in code
          super.init(frame: frame)
          initView()
      }

      public required init?(coder aDecoder: NSCoder) {
          // For use in Interface Builder
          super.init(coder: aDecoder)
          initView()
      }

    // To initialize the nib and constraints for the view
    private func initView() {
        guard let view = loadViewFromNib()
        else { return }
        view.frame = self.bounds
        self.addSubview(view)
        contentView = view
        // Give constraints to the view
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        contentView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        contentView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        contentView.isExclusiveTouch = true
        // Initial view setup
        setUpView()
    }

    // function to load a nib.
    func loadViewFromNib() -> UIView? {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        return nib.instantiate(withOwner: self, options: nil).first as? UIView
    }

    public override func layoutSubviews() {
        if isShadowEnabled {
            self.dropShadow(top: false, left: true, bottom: true, right: true)
        }
    }

    // MARK: - ------- Interface functions -------
    override public func setRowDelegate(as delegate: RowDelegate) {
        rowDelegate = delegate
    }

    /// Adding constraints on self for given view.
    /// - Parameter view: relative view
    func addConstraintsOn(view: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: RowConstants.zero).isActive = true
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: RowConstants.zero).isActive = true
        self.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: RowConstants.bottomSpace).isActive = true
    }

    // MARK: - ------- Configure rows -------
      // Configure the row to make it look like default row
    func  configureDefaultVariationRowImage(with rowContent: RowData, rowType: RowType) {
        self.rowData = rowContent
        self.rowType = rowType
        // setting up particular row depending upon type
        refreshDefaultImageVariationRow()
    }

    // To provide a way for selecting/deselecting a row
    public func didSelectRow(set: Bool) {
        isViewHighlighted = set
        setFloatingRowViewColor(isHighlighted: set)
    }

    // MARK: - ------ Row Actions -------
    @IBAction func rowPressed(gesture: UITapGestureRecognizer) {
        if rowDelegate == nil && clickCompletion == nil {
            return
        }
        // Handle the tile shadow and background color on the tile press event
        if isViewHighlighted == true {
            isViewHighlighted = false
            setFloatingRowViewColor(isHighlighted: isViewHighlighted)
        } else {
            isViewHighlighted = true
            setFloatingRowViewColor(isHighlighted: isViewHighlighted)
        }
        // Notify the delegate about row press action
        notifyAboutRowClickEvent()
    }

}

// MARK: - Private functions
extension AgentFloatingRowView {

    private func refreshDefaultImageVariationRow() {
        // Update data
               updateRowData()
        // Add accessibility
        self.accessibilityElements = [titleLabelOulet!, subtitleLabelOutlet!, disclosureImageView!]
        applyAccessibility(data: self.rowData!)
    }

    // This is used to provide the text that will be used by voiceover when it is enabled
    fileprivate func applyAccessibility(data: RowData) {
        titleLabelOulet.accessibilityLabel = data.title
        subtitleLabelOutlet.accessibilityLabel = data.subtitle
    }

    fileprivate func updateRowData() {
        guard self.rowData != nil
        else { return }
        self.titleLabelOulet.text = self.rowData?.title
        self.subtitleLabelOutlet.text = self.rowData?.subtitle
        self.agentImageView.image = self.rowData?.agentImageView
        self.disclosureImageView.image = self.rowData?.disclosureImageView
    }

    // This is used to provide the initial state of the row UI
    fileprivate func setUpView() {
        // Give bottom shadow to view
        // For dynamic type support
        titleLabelOulet.font = ASTheme.font.ctaButtonSubHeadHeavy
        titleLabelOulet.adjustsFontForContentSizeCategory = true
        titleLabelOulet.textColor = UIColor.primaryDeepBlue
        subtitleLabelOutlet.font = ASTheme.font.subhead
        subtitleLabelOutlet.textColor = UIColor.grey5
        subtitleLabelOutlet.adjustsFontForContentSizeCategory = true
        self.agentImageContainerView.layer.cornerRadius = 8
        self.agentImageContainerView.addSubview(agentImageView)
        self.agentImageContainerView.dropShadow(top: false, left: true, bottom: true, right: true, shadowRadius: 6)
        self.agentImageContainerView.clipsToBounds = false
        self.agentImageView.layer.cornerRadius = 8
        self.agentImageView.layer.masksToBounds = true
        self.agentImageView.clipsToBounds = true
        addTapGestureOnView()
    }

    // This is used to add tap gesture on the row for user interaction
    fileprivate func addTapGestureOnView() {
        tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(rowPressed))
        tapGestureRecognizer.delaysTouchesBegan = true
        allowTapGesture = true
        self.addGestureRecognizer(tapGestureRecognizer)
    }

    // This is used to setup the background color for default and pressed state
    fileprivate func setFloatingRowViewColor(isHighlighted: Bool) {
        if isHighlighted == true {
            contentView.backgroundColor = UIColor.greyShadow // Note: Will be accessed from the Theme
            self.removeBottomShadow()
        } else {
            contentView.backgroundColor = ASTheme.color.background // Note: Will be accessed from the Theme
            if isShadowEnabled {
                self.dropShadow(top: false, left: true, bottom: true, right: true)
            }
        }
    }

    // This is used toset setup the click event of the default row
    fileprivate func notifyAboutRowClickEvent() {
        if rowDelegate != nil {
            rowDelegate?.didPressRow(tag: self.rowData?.rowUniqueId ?? "")
        }
        if let completionBlock = clickCompletion {
            completionBlock(self.rowData?.rowUniqueId ?? "")
        }
    }
}
