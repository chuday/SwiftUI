//
//  Friend.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 11.12.2021.
//

import Foundation

class Friend: Identifiable {
    let id: UUID = UUID()
    let firstName: String
    let lastName: String
    let avatar: String?
    let company: String?
    let city: String?
    
    var userInfo: String {
        [company, city]
            .compactMap { $0 }
            .joined(separator: ", ")
    }
    
    init(firstName: String, lastName: String, avatar: String?, company: String?, city: String?) {
        self.firstName = firstName
        self.lastName = lastName
        self.avatar = avatar
        self.company = company
        self.city = city
    }
    
    func getFullName() -> String {
        return "\(self.firstName) \(self.lastName)"
    }
}
