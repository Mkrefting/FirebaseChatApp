//
//  File.swift
//  RedemptionChat
//
//  Created by Krefting, Max (PGW) on 21/05/2021.
//

import Foundation

struct Message: Hashable {
    let id: String
    let content: String
    let sender: Int // 0 or 1
}

