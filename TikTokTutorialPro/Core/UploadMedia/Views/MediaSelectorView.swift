//
//  MediaSelectorView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 02/02/26.
//

import SwiftUI
import PhotosUI

struct MediaSelectorView: View {
    @State private var player = AVPlayer()
    @State private var showMediaPicker = false
    @State private var selectedItem: PhotosPickerItem?
    @State private var mediaPreview: Movie?
    
    var body: some View {
        NavigationStack {
            VStack {
                CustomVideoPlayer(player: player)
                    .onAppear {
                        player.replaceCurrentItem(with: .init(url: (mediaPreview?.url ?? URL(string: "invalid url.mp4"))!))
                        player.play()
                    }
                    .padding()
            }
            .task(id: selectedItem) {
                await loadMediaPreview(fromItem: selectedItem)
            }
            .navigationTitle(Text("New Post"))
            .navigationBarTitleDisplayMode(.inline)
            .onAppear { showMediaPicker.toggle() }
            .photosPicker(isPresented: $showMediaPicker, selection: $selectedItem, matching: .videos)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Next") {
                        print("DEBUG; Go to upload post..")
                    }
                }
            }
        }
    }
}

private extension MediaSelectorView {
    func loadMediaPreview(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        
        self.mediaPreview = try? await item.loadTransferable(type: Movie.self)
       
    }
}

#Preview {
    MediaSelectorView()
}
