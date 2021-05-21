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
        NavigationView{
            
            VStack{
                Text("All Users")
                ForEach(state.users, id: \.self) { user in
                    
                    HStack{
                        Text(user.email)
                        Button(action: {
                            state.addConversation(userId: user.id)
                            state.getConversations()
                        }, label: {Text("Add Conversation")})
                    }
                    
                }
                
                Text("Your Chats")
                ForEach(state.conversations, id: \.self) { conversation in
                    NavigationLink(destination: ChatView(conversation: conversation)){
                        HStack{
                            Text(conversation.userId1)
                            Text(conversation.userId2)
                            Text(conversation.content)
                        }
                    }
                }
                
            }.toolbar{
                HStack{
                Text(state.getUser().email)
                Spacer()
                Button(action: {
                    state.signOut()
                }, label: {
                    Text("Sign Out")
                })}
            }
            
        }.onAppear{
            state.updateUsers()
            state.getConversations()
        }
        

    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
