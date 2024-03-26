//
//  AuthService.swift
//  TikTok
//
//  Created by Nishant Minerva on 26/03/24.
//

import Foundation
import Firebase
import FirebaseAuth

class AuthService {
    @Published var userSession: FirebaseAuth.User?
    
    func updateUserSession() {
        self.userSession = Auth.auth().currentUser
    }
    
    func login(withEmail email: String, password:String) async throws{
        print("DEBUG: Login with email \(email) and  passwprd \(password)")
    }
    
    func createUser(withEmail email: String, password: String, username: String, fullname: String) async throws {
//        print("DEBUG user info \(email)")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            print("DEBUG : created user \(result.user.uid)")
        } catch {
            print("DEBUG : Failed to create user with email \(error.localizedDescription)")
            throw error
        }
    }
    
    func signout() {
        
    }
}
