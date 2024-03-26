//
//  AuthService.swift
//  TikTok
//
//  Created by Nishant Minerva on 26/03/24.
//

import Foundation
import Firebase

class AuthService {
    func login(withEmail email: String, password:String) async throws{
        print("DEBUG: Login with email \(email) and  passwprd \(password)")
    }
    
    func createUser(withEmail email: String, password: String, username: String, fullname: String) async throws {
        print("DEBUG user info \(email)")
    }
    
    func signout() {
        
    }
}
