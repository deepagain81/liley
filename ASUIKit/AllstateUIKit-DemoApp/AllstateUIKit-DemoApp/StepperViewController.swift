//
//  StepperViewController.swift
//  AllstateUIKit-DemoApp
//
//  Created by Reddy, Sushma (Technosoft) on 18/02/20.
//  Copyright © 2020 Allstate. All rights reserved.
//

import UIKit
import AllstateUIKit

class StepperViewController: UIViewController {

    @IBOutlet weak var stepperView: StepperView!
    @IBOutlet weak var customStepperView: StepperView!

    let totalSteps = 5
    var currentStepNumber = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        stepperView.configure(totalSteps: totalSteps,
                              currentStepNumber: currentStepNumber,
                              title: getTitle())
        setupCustomStepperView()
    }

    func setupCustomStepperView() {
        customStepperView.configure(totalSteps: 7,
                              currentStepNumber: 2,
                              title: getTitle())
        customStepperView.defaultStepColor = .lightGray
        customStepperView.highlightedStepColor = .systemOrange
        customStepperView.titleColor = .systemOrange
        customStepperView.titleFont = UIFont.systemFont(ofSize: 17, weight: .bold)
        customStepperView.title = "Steps completed 2 of 7"
        customStepperView.stepHeight = 6
        customStepperView.itemSpacing = 3
        customStepperView.stepCornerRadius = 5
    }

    func getTitle() -> String {
        return "Step \(currentStepNumber) of \(totalSteps)"
    }

    @IBAction func nextAction(_ sender: Any) {
        if currentStepNumber >= totalSteps {
            return
        }
        currentStepNumber += 1
        stepperView.currentStepNumber = currentStepNumber
        stepperView.title = getTitle()
    }

    @IBAction func previousAction(_ sender: Any) {

        if currentStepNumber <= 0 {
            return
        }

        if currentStepNumber == 1 {
            stepperView.currentStepNumber = currentStepNumber
        } else {
            currentStepNumber -= 1
            stepperView.currentStepNumber = currentStepNumber
        }
        stepperView.title = getTitle()
    }

}
