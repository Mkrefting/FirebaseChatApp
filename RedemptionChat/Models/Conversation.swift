//
//  Conversation.swift
//  RedemptionChat
//
//  Created by Krefting, Max (PGW) on 21/05/2021.
//

import Foundation

struct Conversation: Hashable{
    let id: String
    let userId1: String
    let userId2: String
    //let messages: [Message] = []
    let content: String
}
