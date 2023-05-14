//
//  FriendPhotosView.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 11.12.2021.
//

import SwiftUI
import ASCollectionView

struct FriendPhotosView: View {
    let friend: Friend
    
    @State private var photos: [Photo] = [
        
        Photo(url: "friendVK"),
        Photo(url: "groupVK"),
        Photo(url: "friendVK"),
        Photo(url: "groupVK")
    ]
    
    var body: some View {
        
        ASCollectionView(data: photos) { photo, _ in
            FriendPhotoCellView(photo: photo)
        }.layout {
            .grid(
                layoutMode: .fixedNumberOfColumns(3),
                itemSpacing: 0,
                lineSpacing: 16
            )
        }.navigationTitle(self.friend.getFullName())
    }
}

