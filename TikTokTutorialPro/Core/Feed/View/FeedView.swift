//
//  FeedView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 19/01/26.
//

import SwiftUI
import AVKit

struct FeedView: View {
    @StateObject private var viewModel = FeedViewModel()
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()
    
    var body: some View {
        ScrollView {
            LazyVStack(spacing: 1) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post: post, player: player)
                        .id(post.id)
                        .onAppear() {
                            playInitialVideoIfNecessary()
                        }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear {
            player.play()
        }
        .scrollTargetBehavior(.paging)
        .scrollPosition(id: $scrollPosition)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) { oldValue, newValue in
            playVideoOnChangeOfScrollPosition(postId: newValue)
        }
    }
    
    func playInitialVideoIfNecessary() {
        guard scrollPosition == nil, let post = viewModel.posts.first, player.currentItem == nil else { return }
        
        let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: item)
    }
    
    func playVideoOnChangeOfScrollPosition(postId: String?) {
        guard let currentPost = viewModel.posts.first(where: { $0.id == postId }) else { return }
        
        player.replaceCurrentItem(with:nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

#Preview {
    FeedView()
}
