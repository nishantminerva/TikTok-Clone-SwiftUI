//
//  ContentView.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel(authService: AuthService())
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    ContentView()
}
