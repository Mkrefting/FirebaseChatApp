//
//  ContentView.swift
//  RedemptionChat
//
//  Created by Krefting, Max (PGW) on 14/05/2021.
//

import SwiftUI
import Firebase
import FirebaseAuth
 
struct ContentView: View {
    
    @EnvironmentObject var state: StateController
    
    var body: some View {
        VStack{
            if state.isSignedIn {
                MainView()
            }
            else {
                SignInView()
            }
        }.onAppear {
            state.signedIn = state.isSignedIn
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
