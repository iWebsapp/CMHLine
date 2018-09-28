//
//  NewUser.swift
//  CMHLine
//
//  Created by luis on 9/26/18.
//  Copyright © 2018 luis. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

class NewUser {
    
    private let url:String = "http://cmhline.com/webservice/registrar_usuario.php?usu_matricula="
    
    private func setCreate( enrollment:String, name:String, lastname:String, email:String, phone:String, career:String, password:String, complete: @escaping ((Any) -> Void)) {
        let newUrl:String = self.url + enrollment + "&usu_nombre=" + name + "&usu_apellido=" + lastname + "&usu_mail=" + email + "&usu_tel=" + phone + "&usu_carrera=" + career + "&usu_contrasena=" + password + "&usu_tipo=administrador"
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
    
    public func create( enrollment:String, name:String, lastname:String, email:String, phone:String, career:String, password:String, complete: @escaping ((Any) -> Void)) {
        self.setCreate(enrollment: enrollment, name: name, lastname: lastname, email: email, phone: phone, career: career, password: password) { response in
            let data = JSON(response)
            complete(data)
        }
    }
    
}
