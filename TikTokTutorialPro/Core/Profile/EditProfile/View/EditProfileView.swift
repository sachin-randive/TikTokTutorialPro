//
//  EditProfileView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 31/01/26.
//

import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    
    var body: some View {
        NavigationStack {
            VStack {
                PhotosPicker(selection: $selectedPickerItem, matching: .images) {
                    VStack {
                        if let image = profileImage {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 64, height: 64)
                                .clipShape(Circle())
                                .foregroundStyle(Color(.systemGray4))
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
                    
                    EditProfileOptionRowView(option: EditProfileOptions.name, value: "sachin randive")
                    
                    EditProfileOptionRowView(option: EditProfileOptions.username, value: "sachinrandive01")
                    
                    EditProfileOptionRowView(option: EditProfileOptions.bio, value: "Formula 1 Driver")
                }
                .font(.subheadline)
                .padding()
                Spacer()
            }
            .task(id: selectedPickerItem) {
                await loadImage(fromItem: selectedPickerItem)
            }
            .navigationDestination(for: EditProfileOptions.self, destination: { option in
                Text(option.title)
            })
            .navigationTitle("Edit Profile")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        print("DEBUG: Cancel changes here...")
                    }
                    .foregroundStyle(.black)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Done") {
                        print("DEBUG: Save changes here...")
                    }
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                }
            }
        }
    }
}

extension EditProfileView {
    func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item else { return }
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.profileImage = Image(uiImage: uiImage)
        
    }
}
#Preview {
    EditProfileView()
}

struct EditProfileOptionRowView: View {
    let option: EditProfileOptions
    let value: String
    var body: some View {
        NavigationLink(value: option) {
            Text(option.title)
            
            Spacer()
            
            Text(value)
        }
        .foregroundStyle(.primary)
    }
}
