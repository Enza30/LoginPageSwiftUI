//
//  LoginView.swift
//  LoginPageSwiftUI
//
//  Created by Farendza Muda on 07/09/22.
//

import SwiftUI

struct LoginView: View {
    //Instance for ViewModel
    @StateObject var loginViewModel = LoginViewModel()
    @Binding var signInSuccess: Bool
    
    @State var showView = false
    var body: some View {
        NavigationView{
            VStack {
                Image("login")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .padding()
                
                //Email field
                TextField("Email", text: $loginViewModel.youremailText)
                    .font(Font.system(size: 15))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 3)
                    ).padding()
                
                //Password field
                SecureField("Password", text: $loginViewModel.passwordText)
                    .font(Font.system(size: 15))
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .stroke(Color.gray.opacity(0.5), lineWidth: 3)
                    ).padding()
                
                //Sign In Button
                Button("Login", action: {
                    let createLoginRequest = CreateLoginRequest(email: loginViewModel.youremailText, password: loginViewModel.passwordText)
                    loginViewModel.createLogin(request: createLoginRequest)
                    
                    if (loginViewModel.youremailText == loginViewModel.passwordText){
                        signInSuccess = true
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        showView = true
                    }
                    
                })
                .contentShape(Rectangle())
                .frame(maxWidth: 100, maxHeight: 45, alignment: .center)
                .foregroundColor(.white)
                .background(Color.blue)
                .cornerRadius(10)
                NavigationLink(destination: UserProfileView(), isActive: $showView){
                    EmptyView()
                }
                
            }
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
