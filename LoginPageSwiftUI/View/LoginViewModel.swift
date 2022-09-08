//
//  LoginViewModel.swift
//  LoginPageSwiftUI
//
//  Created by Farendza Muda on 06/09/22.
//

import Foundation
import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var youremailText: String = ""
    @Published var passwordText: String = ""
    @Published var createLoginResponse: CreateLoginResponse?
    
    func createLogin(request: CreateLoginRequest) {
        APIServices.shared.callCreateLogin(parameters: request.dictionary ?? [:]) { response in
            if let response = response {
                print(response)
                
            }
        }
            failure: { error in
               print(error)
            }
    }
}
