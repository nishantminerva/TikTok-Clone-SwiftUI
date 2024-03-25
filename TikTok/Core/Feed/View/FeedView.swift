//
//  FeedView.swift
//  TikTok
//
//  Created by Nishant Minerva on 25/03/24.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 0){
//                ForEach(0..<10) { post in
                ForEach(viewModel.posts) { post in
                        FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear{ playInitialVideoIfNecessary() }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear{
            player.play()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition){oldValue, newValue in
//                print("\(newValue)")
            playVideoOnChangeOfScrollPosition(postID: newValue)
        }
    }
    
    func playInitialVideoIfNecessary() {
        guard scrollPosition == nil,
              let post = viewModel.posts.first,
              player.currentItem == nil else {return}
        let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: item)
    }
    
    func playVideoOnChangeOfScrollPosition(postID: String?) {
        guard let currentPost = viewModel.posts.first(where: {$0.id == postID}) else {return}
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
