//
//  MainTabView.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI

struct MainTabView: View {
    @State private var selectedTab = 0
    private let authService: AuthService
    
    init(authService: AuthService) {
        self.authService = authService
    }
    
    var body: some View {
        TabView{
            FeedView()
                .tabItem {
                    VStack{
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear{ selectedTab = 0}
                .tag(0)
            
            ExploreView()
                .tabItem {
                    VStack{
                        Image(systemName: "person.2")
                            .environment(\.symbolVariants, selectedTab == 1 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear{ selectedTab = 1}
                .tag(1)
            
            Text("Add")
                .tabItem {
                    VStack{
                        Image(systemName: "plus")
                            .environment(\.symbolVariants, selectedTab == 2 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear{ selectedTab = 2}
                .tag(2)
            
            NotificationView()
                .tabItem {
                    VStack{
                        Image(systemName: "heart")
                            .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                        Text("Home")
                    }
                }
                .onAppear{ selectedTab = 3}
                .tag(3)
            
            CurrentUserProfileView(authService: authService)
                .tabItem {
                    VStack{
                        Image(systemName: "person")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                        Text("Profile")
                    }
                }
                .onAppear{ selectedTab = 4}
                .tag(4)
        }
        .tint(.black)
    }
}

#Preview {
    MainTabView(authService: AuthService())
}
