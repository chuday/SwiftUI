//
//  FriendsView.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 11.12.2021.
//

import SwiftUI

struct FriendsView: View {
    
    @State private var friends: [Friend] = [
        
        Friend(firstName: "Serg", lastName: "Art", avatar: nil, company: "mail.ru", city: "Moscow"),
        Friend(firstName: "Petr", lastName: "Brot", avatar: "bob", company: "food", city: "Kazan"),
        Friend(firstName: "Ivan", lastName: "Clear", avatar: nil, company: "yandex", city: "Rostov"),
        Friend(firstName: "Semen", lastName: "Dint", avatar: "bob", company: "maltio", city: nil),
        Friend(firstName: "Petr", lastName: "Food", avatar: nil, company: "yandex", city: nil),
        Friend(firstName: "Oleg", lastName: "Vitro", avatar: "bob", company: "yandex", city: nil),
        Friend(firstName: "Dmitriy", lastName: "Olin", avatar: "bob", company: nil, city: "Oren")
    ]
    
    var body: some View {
        
        List {
            ForEach(friends) { item in
                NavigationLink(destination: FriendPhotosView(friend: item)) {
                    FriendCellView(friend: item)
                    
                }
            }
            .onDelete { indexSet in
                
            }
            .onMove { indexSet, index in
                
            }
        }
        .listStyle(.plain)
        .navigationBarTitle("Friends")
        
    }
}

