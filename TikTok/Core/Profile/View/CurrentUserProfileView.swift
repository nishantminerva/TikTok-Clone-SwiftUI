//
//  CurrentUserProfileView.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI

struct CurrentUserProfileView: View {
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
        }
    }
}

#Preview {
    CurrentUserProfileView()
}
