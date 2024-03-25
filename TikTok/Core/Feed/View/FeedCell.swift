//
//  FeedCell.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI
import AVKit

struct FeedCell: View {
//    var post: Int
    var post: Post
    
    var player: AVPlayer
    
    init(post: Post, player: AVPlayer) {
        self.post = post
//        self.player = AVPlayer(url: URL(string: post.videoUrl)!)
        self.player = player
    }
    
    var body: some View {
        ZStack{
            
//            VideoPlayer(player: AVPlayer(url: URL(string: post.videoUrl)!))
//            CustomVideoPlayer(player: AVPlayer(url: URL(string: post.videoUrl)!))
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal,.vertical])
            
//            Rectangle()
//                .fill(.pink)
//                .containerRelativeFrame([.horizontal,.vertical])
//                .overlay{
//                    Text("post \(post)")
//                        .foregroundStyle(.white)
//                }
            
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
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
    }
}

#Preview {
    FeedCell(post: Post(id: NSUUID().uuidString, videoUrl: ""), player: AVPlayer())
}
