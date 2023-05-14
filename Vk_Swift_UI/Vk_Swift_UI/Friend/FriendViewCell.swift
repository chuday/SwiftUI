//
//  FriendViewCell.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 08.12.2021.
//

import SwiftUI

struct FriendCellView: View {
    
    let friend: Friend
    
    var body: some View {
        
        HStack {
            AvatarImage {
                Image("\(self.friend.avatar ?? "friendVK")")
            }
            
            VStack(alignment: .leading) {
                
                Text("\(self.friend.getFullName())")
                    
                Text("\(self.friend.userInfo)")
                    .font(.footnote)
                    .fontWeight(.thin)
            }
            .lineLimit(1)

            Spacer()
        }
    }
}


