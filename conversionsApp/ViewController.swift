//
//  ViewController.swift
//  conversionsApp
//
//  Created by Douglas Manicka on 05/11/19.
//  Copyright © 2019 Douglas Manicka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tfValue: UITextField!
    @IBOutlet weak var btUnit1: UIButton!
    @IBOutlet weak var btUnit2: UIButton!
    @IBOutlet weak var lbResult: UILabel!
    @IBOutlet weak var lbResultUnit: UILabel!
    @IBOutlet weak var lbUnit: UILabel!
    
    @IBAction func convert(_ sender: UIButton?) {
        print("convert")
        
        if let sender = sender {
            if sender == btUnit1{
                btUnit2.alpha = 0.5
            }else{
                btUnit1.alpha = 0.5
            }
            sender.alpha = 1.0
        }
        
        switch lbUnit.text! {
            case "Temperature":
                calcTemperature()
            case "Weight":
                calcWeight()
            case "Currency":
                calCurrency()
            default:
                calcDistance()
        }
        
    }
    
    func setsToEmptyField(){
     //set placeholder  minimum scale
        tfValue.placeholder = " Type a Value! "
        self.tfValue.subviews
            .forEach {
                if let label = $0 as? UILabel {
                    label.adjustsFontSizeToFitWidth = true
                    label.minimumScaleFactor = 0.3
                }
        }
        tfValue.becomeFirstResponder()
        
        //clean result fields if don't have value to convert
        lbResult.text = "0"
        lbResultUnit.isHidden = true
    }
    
    func calcTemperature(){
        guard let text = tfValue.text, !text.isEmpty, let  temperature = Double(text)  else { return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Farenheint"
            lbResult.text = String(temperature * 1.8 + 32.0)
        }else{
            lbResultUnit.text = "Celsius"
            lbResult.text = String((temperature - 32.0) / 1.8)
        }
    }
    
    func calcWeight(){
        guard let text = tfValue.text, !text.isEmpty, let  weight = Double(text)  else { return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Pounds"
            lbResult.text = String(weight / 2.2046)
        }else{
            lbResultUnit.text = "Kilograms"
            lbResult.text = String(weight * 2.2046)
        }
}
    func calCurrency(){
        guard let text = tfValue.text, !text.isEmpty, let  currency = Double(text)  else { return}

        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Dolar"
            lbResult.text = String(currency / 3.5)
        }else{
            lbResultUnit.text = "Real"
            lbResult.text = String(currency * 3.5)
        }
    }
   
    func calcDistance(){
        guard let text = tfValue.text, !text.isEmpty, let  distance = Double(text)  else { return}
        if btUnit1.alpha == 1.0{
            lbResultUnit.text = "Meters"
            lbResult.text = String(distance * 1000.0)
        }else{
            lbResultUnit.text = "Kilometers"
            lbResult.text = String(distance / 1000.0)
        }
    }
    
    @IBAction func showNextMeasure(_ sender: UIButton) {
        print("showNextMeasure")
        switch lbUnit.text! {
            case "Temperature":
                lbUnit.text =  "Weight"
                btUnit1.setTitle("Kilograms", for: .normal)
                btUnit2.setTitle("Pounds", for: .normal)
            case "Weight":
                lbUnit.text =  "Currency"
                btUnit1.setTitle("Real", for: .normal)
                btUnit2.setTitle("Dolar", for: .normal)
            case "Currency":
                lbUnit.text =  "Distance"
                btUnit1.setTitle("Kilometers", for: .normal)
                btUnit2.setTitle("Meters", for: .normal)
            default:
                lbUnit.text =  "Temperature"
                btUnit1.setTitle("Celsius", for: .normal)
                btUnit2.setTitle("Farenheint", for: .normal)
        }
        convert(nil)
    }
    
    @IBAction func measuresChange() {
        if let text = tfValue.text, text.isEmpty {
            setsToEmptyField()
            lbResult.text = "0"
            lbResultUnit.isHidden = true
        }else{
            lbResultUnit.text = ""
            lbResultUnit.isHidden = false
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let text = tfValue.text, text.isEmpty {
            setsToEmptyField()
        }
        
    }

    override func viewDidLoad() {
      super.viewDidLoad()
        tfValue.placeholder = " Type a Value! "
        tfValue.addTarget(self, action: #selector(measuresChange), for: .editingChanged)

    }


}

<img src="https://github.com/douglasmanicka/conversionsApp/blob/master/conversionsApp/screenshots/screen1.png"  width="350" />
    <img src="https://github.com/douglasmanicka/conversionsApp/blob/master/conversionsApp/screenshots/screen2.png"  width="350" />
        <img src="https://github.com/douglasmanicka/conversionsApp/blob/master/conversionsApp/screenshots/screen3.png"  width="350" />
            <img src="https://github.com/douglasmanicka/conversionsApp/blob/master/conversionsApp/screenshots/screen4.png"  width="350" />
                <img src="https://github.com/douglasmanicka/conversionsApp/blob/master/conversionsApp/screenshots/screen5.png"  width="350" />
                    <img src="https://github.com/douglasmanicka/conversionsApp/blob/master/conversionsApp/screenshots/screen6.png"  width="350" />


                        <span><img src="/conversionsApp/screenshots/screen1.png" width="350"/>
<img src="/conversionsApp/screenshots/screen2.png" width="350"/>
<img src="/conversionsApp/screenshots/screen3.png" width="350"/>
<img src="/conversionsApp/screenshots/screen4.png" width="350"/>
<img src="/conversionsApp/screenshots/screen5.png" width="350"/>
<img src="/conversionsApp/screenshots/screen6.png" width="350"/></span>
