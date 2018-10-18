//
//  LiveSessionsController.swift
//  CMHLine
//
//  Created by luis on 9/27/18.
//  Copyright © 2018 luis. All rights reserved.
//

import UIKit
import WebKit

class LiveSessionsController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        DispatchQueue.main.async {
            let url = URL(string: "http://www.ustream.tv/embed/23582106?html5ui")
            let req = URLRequest(url: url!)
            self.webView.load(req)
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
