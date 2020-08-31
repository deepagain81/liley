//
//  ViewController.swift
//  LileyStoreIOS
//
//  Created by Chapagain, Deepak (INFOSYS) on 8/9/20.
//  Copyright © 2020 Chapagain, Deepak. All rights reserved.
//

import UIKit
import LSUIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderDisplay1: UILabel!
    @IBOutlet weak var sliderDisplay2: UILabel!
    
    @IBOutlet weak var slider1: UISlider!
    @IBOutlet weak var slider2: UISlider!
    
    @IBOutlet weak var resultDisplay: UILabel!
    @IBOutlet weak var multiply: UIButton!
    var valX: Int = 0
    var valY: Int = 0
    
    
    var multipler: Multiply?
    
    @IBAction func slider2Action(_ sender: UISlider) {
        valX = Int(sender.value)
        sliderDisplay2.text = "\(valX)"
        
    }
    @IBAction func slider1Action(_ sender: UISlider) {
        valY = Int(sender.value)
        sliderDisplay1.text = "\(valY)"
    }
    @IBAction func MultiplyBtn(_ sender: Any) {
        let result = multipler?.multiple(valueX: valX, with: valY)
        resultDisplay.text = "\(result ?? 00)"
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        multipler = Multiply()
        setUp()
    }
    private func setUp(){
        resultDisplay.text = "00"
        sliderDisplay2.text = "0"
        sliderDisplay1.text = "0"
        
    }


}

