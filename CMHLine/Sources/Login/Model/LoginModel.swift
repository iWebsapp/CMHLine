//
//  LoginModel.swift
//  CMHLine
//
//  Created by luis on 9/26/18.
//  Copyright © 2018 luis. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class LoginModel {


    private let url:String = "http://cmhline.com/webservice/valida_usuario.php?usu_matricula="
    
    private func setLogin( enrollment:String, password:String, complete: @escaping ((Any) -> Void)) {
        let newUrl:String = self.url + enrollment + "&usu_contrasena=" + password
        Alamofire.request(newUrl, method: .get ).responseJSON { resp in
            switch resp.result {
                case .success(let value):
                    let data = JSON(value)
                    complete(data)
                case .failure(let error):
                    let err = "\(error.localizedDescription)"
                    complete(err)
            }
        }
    }
    
    public func login( enrollment:String, password:String, complete: @escaping ((Any) -> Void)) {
        self.setLogin(enrollment: enrollment, password: password) { response in
            let data = JSON(response)
            complete(data)
        }
    }
    
}
