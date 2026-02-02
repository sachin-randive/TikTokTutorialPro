//
//  MediaSelectorView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 02/02/26.
//

import SwiftUI
import PhotosUI

struct MediaSelectorView: View {
    @State private var showMediaPicker = false
    @State private var selectedItem: PhotosPickerItem?
    
    var body: some View {
        NavigationStack {
            VStack {
                
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

#Preview {
    MediaSelectorView()
}
