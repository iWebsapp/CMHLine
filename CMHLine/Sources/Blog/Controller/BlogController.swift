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
        DispatchQueue.main.async {
            let url = URL(string: "http://noticias.cmhline.com")
            let req = URLRequest(url: url!)
            self.webView.load(req)
        }

    }
    

}
