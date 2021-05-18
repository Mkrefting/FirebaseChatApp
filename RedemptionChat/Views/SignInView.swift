//
//  SignInView.swift
//  RedemptionChat
//
//  Created by Krefting, Max (PGW) on 18/05/2021.
//

import SwiftUI
import Firebase
import FirebaseAuth
 

struct SignInView: View {
    
    @EnvironmentObject var state: StateController
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    var body: some View {
        NavigationView{
            VStack{
                Image("logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 100)
                
                VStack{
                    
                    TextField("Email Address", text: $email)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
        
                    SecureField("Password", text: $password)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding()
                        .background(Color(.secondarySystemBackground))
                
                    Button(action: {
                        guard !email.isEmpty, !password.isEmpty else {
                            return
                        }
                        state.signIn(email: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .foregroundColor(Color.white)
                            .frame(width: 200, height: 50)
                            .cornerRadius(8)
                            .background(Color.blue)
                    })
                    
                    NavigationLink("Create Account", destination: SignUpView())
                        .padding()
                    
                }.padding()
                
                Spacer()
                
            }.navigationBarTitle("Sign In")
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
