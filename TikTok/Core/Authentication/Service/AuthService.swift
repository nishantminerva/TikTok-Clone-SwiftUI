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
//        print("DEBUG: Login with email \(email) and  passwprd \(password)")
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            print("DEBUG : login user \(result.user.uid)")
            self.userSession = result.user
        } catch {
            print("DEBUG : Failed to log in user with email \(error.localizedDescription)")
            throw error
        }
    }
    
    func createUser(withEmail email: String, password: String, username: String, fullname: String) async throws {
//        print("DEBUG user info \(email)")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
//            print("DEBUG : created user \(result.user.uid)")
            self.userSession = result.user
        } catch {
            print("DEBUG : Failed to create user with email \(error.localizedDescription)")
            throw error
        }
    }
    
    func signout() {
        try? Auth.auth().signOut() // sign user out on beckend
        self.userSession = nil // updates routing logic by wiping user session
    }
}
