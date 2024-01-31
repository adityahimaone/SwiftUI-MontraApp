//
//  UserModel.swift
//  MontraApp
//
//  Created by Aditya Himawan on 30/01/24.
//

import Foundation

struct UserData {
    var name: String
    var email: String
    var password: String
}

extension  UserData {
    static let data: UserData = {
        UserData(name: "Aditya Himawan", email: "test@mail.com", password: "123456")
    }()
}
