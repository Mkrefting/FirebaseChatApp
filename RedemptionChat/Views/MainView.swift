//
//  MainView.swift
//  RedemptionChat
//
//  Created by Krefting, Max (PGW) on 18/05/2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var state: StateController

    
    var body: some View {
        VStack{
            Button(action: {
                state.signOut()
            }, label: {
                Text("Sign Out")
            })
            
            Text("Create app here!")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
