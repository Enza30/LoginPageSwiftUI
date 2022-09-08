//
//  UserProfileView.swift
//  LoginPageSwiftUI
//
//  Created by Farendza Muda on 07/09/22.
//

import SwiftUI

struct UserProfileView : View {
    
    var body: some View{
        ScrollView(.vertical){
            ZStack(alignment: .top) {
                VStack{
                    VStack{
                        Image("user")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 100, height: 100)
                        
                        Text(verbatim: "Eve Holt")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .padding(.top, 10)
                        Text("eve.holt@reqres.in")
                            .font(.title3)
                        
                    }
                }
            }
        }
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView()
    }
}
