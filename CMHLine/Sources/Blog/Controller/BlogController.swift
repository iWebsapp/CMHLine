//
//  BlogController.swift
//  CMHLine
//
//  Created by luis on 9/27/18.
//  Copyright © 2018 luis. All rights reserved.
//

import UIKit
import WebKit

class BlogController: UIViewController {
    
    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "http://noticias.cmhline.com")
        let req = URLRequest(url: url!)
        webView.load(req)
    }
    
    @IBAction func btnLogout(_ sender: UIButton) {
        self.alertAvanced(this: self, titileAlert: "Cerrar sesión", bodyAlert: "¿Está seguro de cerrar su sessión?") { response in
            if response == "acept" {
                UserDefaults.standard.removeObject(forKey: "token")
                self.performSegue(withIdentifier: "goLogout", sender: self )
            }
        }
    }
    
    
}
