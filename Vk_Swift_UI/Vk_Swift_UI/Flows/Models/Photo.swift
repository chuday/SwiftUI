//
//  Photo.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 11.12.2021.
//

import Foundation

class Photo: Identifiable {
    let id: UUID = UUID()
    let url: String
    
    init(url: String) {
        self.url = url
    }
}
