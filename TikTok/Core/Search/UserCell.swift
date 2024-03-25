//
//  UserCell.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing:12){
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 48,height: 48)
                .foregroundStyle(Color(.systemGray))
            
            VStack(alignment: .leading){
                Text("test_name")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                Text("username")
                    .font(.footnote)
                
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

#Preview {
    UserCell()
}
