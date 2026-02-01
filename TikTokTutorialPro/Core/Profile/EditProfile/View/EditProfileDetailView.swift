//
//  EditProfileDetailView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 31/01/26.
//

import SwiftUI

struct EditProfileDetailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var value = ""
    
    let option: EditProfileOptions
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Add your bio", text: $value)
                
                Spacer()
                
                if !value.isEmpty {
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.gray)
                    }
                }
            }
            
            Divider()
            Text("Tell us little bit about yourself")
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top, 8)
            
            Spacer()
        }
        .padding()
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear{onViewAppear()}
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save") {
                    dismiss()
                }
                .fontWeight(.semibold)
            }
        }
    }
}

private extension EditProfileDetailView {
    var subTitle: String {
        switch option {
        case .name:
            return "Your name can only be chnaged once every 7 days"
        case .username:
            return "Username can contain letters, numbers, periods and underscores."
        case .bio:
            return "Tell us a  little bit about yourself"
        }
    }
    
    func onViewAppear() {
        switch option {
        case .name:
            value = user.fullname
        case .username:
            value = user.username
        case .bio:
            value = user.bio ?? " "
        }
    }
}

#Preview {
    NavigationStack {
        EditProfileDetailView(option: .username, user: DeveloperPreview.user)
            .tint(.primary)
    }
}
