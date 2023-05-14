//
//  GroupsView.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 11.12.2021.
//

import SwiftUI

struct GroupsView: View {
    @State private var groups: [Group] = [
        Group(name: "Oren news", avatar: "groupVK"),
        Group(name: "IT", avatar: "groupVK"),
        Group(name: "Geek brains", avatar: nil),
        Group(name: "Danger", avatar: "groupVK"),
    ]
    
    var body: some View {
        List(groups.sorted(by: { $0.name < $1.name}), rowContent: { group in
            GroupCellView(group: group)
        })
        .listStyle(.plain)
        .navigationBarTitle(Text("Groups"))
    }
}
