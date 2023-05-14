//
//  GroupViewCell.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 08.12.2021.
//

import SwiftUI

struct GroupCellView: View {
    
    let group: Group
    
    var body: some View {
        
        HStack {
            AvatarImage {
                Image("\(self.group.avatar ?? "bob")")            }

            Text("\(self.group.name)")
                .font(.subheadline)
            
            Spacer()
        }
    }
}
