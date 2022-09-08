//
//  ContentView.swift
//  LoginPageSwiftUI
//
//  Created by Farendza Muda on 06/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var signInSuccess =  false
    
    var body: some View {
        return Group {
            if signInSuccess {
                UserProfileView()
            } else {
                LoginView(signInSuccess: $signInSuccess)
            }
        }
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
