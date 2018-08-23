//
//  ViewController.swift
//  IOS-Easy-Task
//
//  Created by Roman Akhtariev on 2018-08-22.
//  Copyright © 2018 Roman Akhtariev. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    var formatted : String = "Error getting weather data"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("https://api.openweathermap.org/data/2.5/weather?id=4699066&units=metric&APPID=08a1e41fb5aa6a16444c5dbe3f4f077a").responseJSON { response in
            
            
            if let data = response.result.value {
                let json = JSON(data)
                
                let weather = json["main"]["temp"].doubleValue
                
                self.formatted = String(format: "Weather in Houston, TX: %.2f C", weather)
            }
        }
    }
    



    @IBAction func buttonPressed(_ sender: Any) {
        
        textField.text! = formatted
    }
      
        
        
}


