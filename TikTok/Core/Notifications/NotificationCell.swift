//
//  NotificationCell.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack{
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 32,height: 32)
                .foregroundStyle(Color(.systemGray5))
            HStack{
                Text("nisha.kumar ")
                    .font(.footnote)
                    .fontWeight(.semibold) +
                
                Text("nisha.kumar is very happy to see your pitch. ")
                    .font(.footnote) +
                
                Text("3d")
                    .font(.caption)
                
                
            }
            
            Spacer()
            
            Rectangle()
                .frame(width: 48,height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
