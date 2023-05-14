//
//  FriendPhotoCellView.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 11.12.2021.
//

import SwiftUI

struct FriendPhotoCellView: View {
    
    let photo: Photo
    
    var body: some View {
        
        VStack {
            Image("\(self.photo.url)")
                .resizable()
                .frame(width: 90, height: 90)
            
            HStack {
                Button(action: { print("press button") }) {
                    Image(systemName: "\(self.photo.url)")
                }
                
                Text("\(self.photo.url)")
            }
            .lineLimit(1)
        }
        .frame(width: 100, height: 125)
    }
}
