//
//  CardViewController.swift
//  AllstateUIKit

import UIKit

class SheetViewController: UIViewController {
    @IBOutlet private weak var handleArea: UIView!
    @IBOutlet private weak var handleIdentifierView: UIView!
    @IBOutlet private var content: UIView! = UIView()
    weak var presenter: UIViewController?
    var visualEffectView: UIVisualEffectView!
    var sheetHeight: CGFloat = SheetConstants.CardSpecifications.initial
    let sheetHandleAreaHeight: CGFloat = SheetConstants.CardSpecifications.handleHeight
    var cardVisible = false
    var isStateChanged: SheetState = .collapsed {
        willSet {
            SheetViewController.state = newValue
        }
        didSet {
            changeState()
        }
    }
    static var state: SheetState = .intermediate
    var previousState: SheetState = .collapsed

    ///Array of all the active animation is stored and calculated when to stop the animation
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted: CGFloat = SheetConstants.CardSpecifications.initial
    override func viewDidLoad() {
        super.viewDidLoad()
        handleIdentifierView.layer.cornerRadius = SheetConstants.CardSpecifications.handleIdentifierRadius
        sheetHeight = (presenter?.view.frame.height ?? 0) -
            (UIApplication.shared.windows.first?.safeAreaInsets.top)!
        self.view.frame = CGRect(x: 0,
                                 y: (7/8)*(presenter?.view.frame.height ?? 0) -
                                    (UIApplication.shared.windows.first?.safeAreaInsets.bottom)! ,
                                 width: presenter?.view.frame.width ?? 0,
                                 height: presenter?.view.frame.height ?? 0)
    }
    func setPresenter(with presenter: UIViewController) {
        self.presenter = presenter
    }
    func setUpSheet() {
        visualEffectView = UIVisualEffectView()
        visualEffectView.frame = self.view.frame
        if let presenterVC = self.presenter {
            presenterVC.view.addSubview(visualEffectView)
            presenterVC.addChild(self)
            presenterVC.view.addSubview(self.view)
        }
        self.view.clipsToBounds = true
        self.view.layer.cornerRadius = SheetConstants.CardSpecifications.cornerRadius
        self.handleArea.layer.cornerRadius = SheetConstants.CardSpecifications.cornerRadius
        self.view.layoutIfNeeded()
        let tapGestureRecognizer = UITapGestureRecognizer(target:
            self, action: #selector(SheetViewController.handleCardTap(recognzier:)))
        let panGestureRecognizer = UIPanGestureRecognizer(target:
            self, action: #selector(SheetViewController.handleCardPan(recognizer:)))
        self.handleArea.addGestureRecognizer(tapGestureRecognizer)
        self.handleArea.addGestureRecognizer(panGestureRecognizer)
    }
    @objc
    func handleCardTap(recognzier: UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: SheetViewController.state,
                                      duration: SheetConstants.CardSpecifications.animationTime)
            changeState()
        default:
            break
        }
    }
    @objc
    func handleCardPan (recognizer: UIPanGestureRecognizer) {
        switch recognizer.state {
        case .began:
            startInteractiveTransition(state: SheetViewController.state,
                                       duration: SheetConstants.CardSpecifications.animationTime)
            changeState()
        case .changed:
            let translation = recognizer.translation(in: self.handleArea)
            var fractionComplete = translation.y / sheetHeight
            fractionComplete = cardVisible ? fractionComplete : -fractionComplete
            updateInteractiveTransition(fractionCompleted: fractionComplete)
            changeState()
        case .ended:
            continueInteractiveTransition()
        default:
            break
        }
    }
    func changeState() {
        animateTransitionIfNeeded(state: SheetViewController.state,
                                  duration: SheetConstants.CardSpecifications.animationTime)
        if SheetViewController.state == .collapsed {
            previousState = SheetViewController.state
            SheetViewController.state = .intermediate
        } else if SheetViewController.state == .intermediate && previousState == .collapsed {
            previousState = SheetViewController.state
            SheetViewController.state = .expanded
        } else if SheetViewController.state == .intermediate && previousState == .expanded {
            previousState = SheetViewController.state
            SheetViewController.state = .collapsed
        } else {
            previousState = SheetViewController.state
            SheetViewController.state = .collapsed
        }
    }
    func animateTransitionIfNeeded (state: SheetState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.view.frame.origin.y =
                        (UIApplication.shared.windows.first?.frame.height ??
                            SheetConstants.CardSpecifications.initial) - self.sheetHeight
                case .collapsed: //406 is height of view
                    self.view.frame.origin.y =
                        SheetConstants.CardSpecifications.cardHeigthRatio*(UIApplication
                            .shared.windows.first?.frame.height ??
                            SheetConstants.CardSpecifications.initial) -
                        (UIApplication.shared.windows.first?.safeAreaInsets.bottom)!
                case .intermediate:
                    self.view.frame.origin.y =
                        (UIApplication.shared.windows.first?.frame.height ??
                            SheetConstants.CardSpecifications.initial)/2
                }
            }
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            let blurAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.visualEffectView.effect = UIBlurEffect(style: .dark)
                case .collapsed:
                    self.visualEffectView.effect = nil
                case .intermediate:
                    self.visualEffectView.effect = nil
                }
            }
            blurAnimator.startAnimation()
            runningAnimations.append(blurAnimator)
        }
    }
    func startInteractiveTransition(state: SheetState, duration: TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    func updateInteractiveTransition(fractionCompleted: CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    func continueInteractiveTransition () {
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor:
                SheetConstants.CardSpecifications.initial)
        }
    }
}
extension UIViewController {
    //getting view from xib to the ViewControllerScreen
    private static func getView<T: UIViewController>() -> T {
        let name = String(describing: T.self)
        let bundle = Bundle.init(for: T.self)
        return T.init(nibName: name, bundle: bundle)
    }
    ///getting view from xib to the ViewControllerScreen
    public static func getNib() -> Self {
        return getView()
    }
}
