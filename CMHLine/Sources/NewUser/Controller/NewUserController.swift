//
//  NewUserController.swift
//  CMHLine
//
//  Created by luis on 9/26/18.
//  Copyright © 2018 luis. All rights reserved.
//

import UIKit
import SwiftyJSON

class NewUserController: UIViewController {

    @IBOutlet weak var listenerCreateUser: DesignableButton!
    @IBOutlet weak var txtEnrollment: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtLastname: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPhone: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    private let newUser: NewUser = NewUser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        listenerCreateUser.isEnabled = false
    }
    
    private func valid(){
        if (txtEnrollment.text?.count)! > 0 {
            if (txtName.text?.count)! > 0 {
                if (txtLastname.text?.count)! > 0 {
                    if (txtEmail.text?.count)! > 0 {
                        if (txtPhone.text?.count)! > 0 {
                            if (txtPassword.text?.count)! > 0 {
                                listenerCreateUser.isEnabled = true
                            } else {
                                listenerCreateUser.isEnabled = false
                            }
                        } else {
                            listenerCreateUser.isEnabled = false
                        }
                    } else {
                        listenerCreateUser.isEnabled = false
                    }
                } else {
                    listenerCreateUser.isEnabled = false
                }
            } else {
                listenerCreateUser.isEnabled = false
            }
        } else {
            listenerCreateUser.isEnabled = false
        }
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        dismiss(animated: true, completion: nil )
    }
    
    @IBAction func changedEnrollment(_ sender: UITextField) {
        if (txtEnrollment.text?.count)! > 0 {
            valid()
        } else {
            listenerCreateUser.isEnabled = false
        }
    }
    
    @IBAction func changedName(_ sender: UITextField) {
        if (txtName.text?.count)! > 0 {
            valid()
        } else {
            listenerCreateUser.isEnabled = false
        }
    }
    
    @IBAction func changedLastName(_ sender: UITextField) {
        if (txtLastname.text?.count)! > 0 {
            valid()
        } else {
            listenerCreateUser.isEnabled = false
        }
    }
    
    @IBAction func changedEmail(_ sender: UITextField) {
        if (txtEmail.text?.count)! > 0 {
            valid()
        } else {
            listenerCreateUser.isEnabled = false
        }
    }
    
    @IBAction func changedPhone(_ sender: UITextField) {
        if (txtPhone.text?.count)! > 0 {
            valid()
        } else {
            listenerCreateUser.isEnabled = false
        }
    }
    
    @IBAction func changedPassword(_ sender: UITextField) {
        if (txtPassword.text?.count)! > 0 {
            valid()
        } else {
            listenerCreateUser.isEnabled = false
        }
    }
    
    @IBAction func btnCreateUser(_ sender: DesignableButton) {
        newUser.create(enrollment: txtEnrollment.text!, name: txtName.text!, lastname: txtLastname.text!, email: txtEmail.text!, phone: txtPhone.text!, career: "Dinosaurios", password: txtPassword.text!) { response in
            let data = JSON(response)
            if(data[0].count) == 0 {
                self.alertSimple(this: self, titileAlert: "Se ha producido un error", bodyAlert: "Inténtalo más tarde", complete: { resp in
                    self.txtEnrollment.text = ""
                    self.txtName.text = ""
                    self.txtLastname.text = ""
                    self.txtEmail.text = ""
                    self.txtPhone.text = ""
                    self.txtPassword.text = ""
                })
            } else {
                self.alertSimple(this: self, titileAlert: "Exito", bodyAlert: "Se ha creado tu cuenta con exito!", complete: { resp in
                    self.dismiss(animated: true, completion: nil )
                })
            }
        }
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
