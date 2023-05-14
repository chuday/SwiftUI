//
//  LoginService.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 11.12.2021.
//

import Foundation

class LoginService {
    let correctInputLogin = "Admin"
    let correctInputPassword = "123456"
    
    func checkUserData(login: String, password: String) -> Bool {
        if login == correctInputLogin && password == correctInputPassword {
            return true
        } else {
            return false
        }
    }
}
