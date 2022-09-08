//
//  Models.swift
//  LoginPageSwiftUI
//
//  Created by Farendza Muda on 06/09/22.
//

import Foundation

//Request
struct CreateLoginRequest: Codable {
    var email: String?
    var password: String?
}

//Response
struct CreateLoginResponse: Codable {
    var token: String
}

