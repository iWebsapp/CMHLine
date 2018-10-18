//
//  ViewController.swift
//  CMHLine
//
//  Created by luis on 9/26/18.
//  Copyright © 2018 luis. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnLogin(_ sender: DesignableButton) {
        UserDefaults.standard.set("login success", forKey: "token")
        self.performSegue(withIdentifier: "goUser", sender: self )
    }


}

