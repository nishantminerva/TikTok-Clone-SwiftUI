//
//  UserStatView.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI

struct UserStatView: View {
    let value: Int
    let title: String
    
    var body: some View {
        VStack{
            Text("\(value)")
                .font(.subheadline)
                .fontWeight(.bold)
            
            Text("\(title)")
                .font(.caption)
                .foregroundStyle(.gray)
        }
    }
}


#Preview {
    UserStatView(value: 7, title: "Likes")
}
