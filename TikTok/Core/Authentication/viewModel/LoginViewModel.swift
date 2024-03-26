//
//  LoginViewModel.swift
//  TikTok
//
//  Created by Nishant Minerva on 26/03/24.
//

import Foundation

class LoginViewModel:ObservableObject{
    
    private let authService: AuthService
    
    init(authService: AuthService){
        self.authService = authService
    }
    
    func login(withEmail email: String, password: String) async {
        do{
            try await authService.login(withEmail: email, password: password)
        } catch {
            print("Debug : Did fail to log in with error: \(error.localizedDescription)")
        }
    }
}
