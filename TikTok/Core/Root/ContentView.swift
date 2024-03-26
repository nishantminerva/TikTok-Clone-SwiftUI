//
//  ContentView.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI

struct ContentView: View {
//    @StateObject var viewModel = ContentViewModel(authService: AuthService())
    @StateObject var viewModel: ContentViewModel
    private let authService: AuthService
    
    init(authService: AuthService){
        self.authService = authService
        let vm = ContentViewModel(authService: authService)
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                MainTabView(authService: authService)
            } else {
                LoginView(authService: authService)
            }
        }
    }
}

#Preview {
    ContentView(authService: AuthService())
}
