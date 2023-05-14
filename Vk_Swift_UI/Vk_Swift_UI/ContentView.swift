//
//  ContentView.swift
//  Vk_Swift_UI
//
//  Created by Mikhail Chudaev on 11.12.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var shouldShowMainView: Bool = false
    
    var body: some View {
        
        NavigationView {
            
            HStack {
                LoginView(isUserLoggedIn: $shouldShowMainView)

                NavigationLink(
                    destination:
                        TabView {
                            
                            FriendsView()
                                .tabItem {
                                    Image(systemName: "person.circle")
                                    Text("Friends")
                                }
                            
                            GroupsView()
                                .tabItem {
                                    Image(systemName: "person.3")
                                    Text("Groups")
                                }
                            
                            NewsView()
                                .tabItem {
                                    Image(systemName: "newspaper")
                                    Text("News")
                                }
                        }
                        .navigationBarBackButtonHidden(true),
                    isActive: $shouldShowMainView,
                    label: {
                        EmptyView()
                    }
                )
            }
        }
    }
}

