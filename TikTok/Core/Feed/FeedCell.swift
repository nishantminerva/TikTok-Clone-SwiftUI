//
//  FeedCell.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI

struct FeedCell: View {
    var post: Int
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(.pink)
                .containerRelativeFrame([.horizontal,.vertical])
                .overlay{
                    Text("post \(post)")
                        .foregroundStyle(.white)
                }
            
            VStack{
                Spacer()
                
                HStack(alignment: .bottom) {
                    VStack(alignment: .leading){
                        Text("Nishant")
                        Text("Rocket ship prepae=re for takeoff")
                    }
                    .foregroundStyle(.white)
                    .font(.headline)
                    
                    Spacer()
                    
                    VStack(spacing: 20) {
                        
                        Circle()
                            .frame(width: 40,height: 40)
                            .foregroundStyle(.gray)
                        
                        Button{
                            
                        } label: {
                            VStack {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28,height: 28)
                                .foregroundStyle(.white)
                                
                                Text("27")
                                    .font(.caption)
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        }
                        
                        Button{
                            
                        } label: {
                            VStack {
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28,height: 28)
                                .foregroundStyle(.white)
                                
                                Text("27")
                                    .font(.caption)
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 28,height: 22)
                                .foregroundStyle(.white)
                        }
                        Button{
                            
                        } label: {
                            Image(systemName: "arrowshape.turn.up.right.fill")
                                .resizable()
                                .frame(width: 28,height: 28)
                                .foregroundStyle(.white)
                        }
                        
                    }
                }
                .padding(.bottom,80)
            }
            .padding()
        }
    }
}

#Preview {
    FeedCell(post: 2)
}
