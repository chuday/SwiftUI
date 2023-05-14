//
//  Group.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 11.12.2021.
//

import Foundation


class Group: Identifiable {
    let id: UUID = UUID()
    let name: String
    let avatar: String?
    
    init(name: String, avatar: String?) {
        self.name = name
        self.avatar = avatar
    }
}
