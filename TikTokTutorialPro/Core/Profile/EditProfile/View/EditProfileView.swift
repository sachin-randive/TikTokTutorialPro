//
//  EditProfileView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 31/01/26.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var uiImgae: UIImage?
    
    @StateObject var manager = EditProfileManager(imageUploader: ImageUploader())
    
    let user: User
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedPickerItem, matching: .images) {
                    VStack {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: avatarSize.dimention, height: avatarSize.dimention)
                                .clipShape(Circle())
                        } else {
                            AvatarView(user: user, size: avatarSize)
                        }
                        
                        Text("Change photo")
                    }
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemGray2))
                    
                    EditProfileOptionRowView(option: EditProfileOptions.name, value: user.fullname)
                    
                    EditProfileOptionRowView(option: EditProfileOptions.username, value: user.username)
                    
                    EditProfileOptionRowView(option: EditProfileOptions.bio, value: user.bio ?? "Add a bio")
                }
                .font(.subheadline)
                .padding()
                Spacer()
            }
            .task(id: selectedPickerItem) {
                await loadImage(fromItem: selectedPickerItem)
            }
            .navigationDestination(for: EditProfileOptions.self) { option in
               // EditProfileDetailView(option: option)
                EditProfileDetailView(option: option, user: user)
            }
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        onDoneTapped()
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

private extension EditProfileView {
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImgae = uiImage
        self.profileImage = Image(uiImage: uiImage)
        
    }
    
    func onDoneTapped() {
        Task {
            guard  let uiImgae else { return }
            await manager.uploadProfileImage(uiImgae)
            dismiss()
        }
    }
    var avatarSize: AvatarSize {
        return .large
    }
}

#Preview {
    EditProfileView(user: DeveloperPreview.user)
}


