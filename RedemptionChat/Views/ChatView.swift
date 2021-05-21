//
//  ChatView.swift
//  RedemptionChat
//
//  Created by Krefting, Max (PGW) on 21/05/2021.
//

import SwiftUI

struct ChatView: View {
    let conversation: Conversation
    var body: some View {
        VStack{
            Text(conversation.content)
        }
    }
}
