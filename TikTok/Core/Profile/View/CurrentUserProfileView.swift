//
//  CurrentUserProfileView.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
   
    let authService: AuthService
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(spacing: 2){
//                    Profile view
                    ProfileHeaderView()
//                    post grid view
                    PostGridView()
                }
                .padding(.top)
            }
            .navigationTitle("Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button("Sign Out"){
//                        print("DEBUG: signout")
                        authService.signout()
                    }
                    .font(.subheadline)
                    .fontWeight(.semibold)
                }
            }
        }
    }
}

#Preview {
    CurrentUserProfileView(authService: AuthService())
}
