//
//  SettingsController.swift
//  CMHLine
//
//  Created by luis on 9/28/18.
//  Copyright © 2018 luis. All rights reserved.
//

import UIKit

class SettingsController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    @IBAction func btnLogout(_ sender: DesignableButton) {
        self.alertAvanced(this: self, titileAlert: "Cerrar sesión", bodyAlert: "¿Está seguro de cerrar su sessión?") { response in
            if response == "acept" {
                UserDefaults.standard.removeObject(forKey: "token")
                self.performSegue(withIdentifier: "goLogout", sender: self )
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
