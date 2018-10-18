//
//  LoginController.swift
//  CMHLine
//
//  Created by luis on 9/26/18.
//  Copyright © 2018 luis. All rights reserved.
//

import UIKit
import SwiftyJSON

class LoginController: UIViewController {

    @IBOutlet weak var txtEnrollment: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var listenerLogin: DesignableButton!
    private let loginModel:LoginModel = LoginModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listenerLogin.isEnabled = false
        // Do any additional setup after loading the view.
    }
    
    private func valid(){
        if (txtEnrollment.text?.count)! > 0 {
            if (txtPassword.text?.count)! > 0 {
                listenerLogin.isEnabled = true
            } else {
                listenerLogin.isEnabled = false
            }
        } else {
            listenerLogin.isEnabled = false
        }
    }
    
    @IBAction func changedEnrollment(_ sender: UITextField) {
        if (txtEnrollment.text?.count)! > 0 {
            valid()
        } else {
            listenerLogin.isEnabled = false
        }
    }
    
    @IBAction func changedPassword(_ sender: UITextField) {
        if (txtPassword.text?.count)! > 0 {
            valid()
        } else {
            listenerLogin.isEnabled = false
        }
    }
    
    @IBAction func btnLogin(_ sender: DesignableButton) {
        loginModel.login(enrollment: txtEnrollment.text!, password: txtPassword.text!) { response in
            let data = JSON(response)
            print(data[0].count)
            if(data[0].count) == 0 {
                self.alertSimple(this: self, titileAlert: "Se ha producido un error", bodyAlert: "Tus credenciales son invalidas", complete: { resp in
                    self.txtPassword.text = ""
                    self.txtEnrollment.text = ""
                })
            } else {
                UserDefaults.standard.set("login success", forKey: "token")
                self.performSegue(withIdentifier: "goUser", sender: self )
            }
        }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil )
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
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
