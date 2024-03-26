//
//  ContentViewModel.swift
//  TikTok
//
//  Created by Nishant Minerva on 26/03/24.
//

import Foundation
import FirebaseAuth
import Combine

class ContentViewModel : ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    
    private let authService: AuthService
    private var cancellables = Set<AnyCancellable>()
    
    init(authService: AuthService) {
        self.authService = authService
        
        setupSubscriber()
        authService.updateUserSession()
    }
    
    private func setupSubscriber() {
        authService.$userSession.sink {[weak self] user in
            self?.userSession = user
        }.store(in: &cancellables)
    }
}
