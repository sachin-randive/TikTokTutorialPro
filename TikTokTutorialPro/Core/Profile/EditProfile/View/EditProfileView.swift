//
//  EditProfileView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 31/01/26.
//

import SwiftUI

struct EditProfileView: View {
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    Circle()
                        .frame(width: 64, height: 64)
                    
                    Button("Change photo"){
                        print("DEBUG: Change photo here...")
                    }
                    .foregroundStyle(.black)
                }
                .padding()
                
                VStack(alignment: .leading, spacing: 24) {
                    Text("About you")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemGray2))
                    
                    HStack {
                        Text("Name")
                        
                        Spacer()
                        
                        Text("Sachin Randive")
                    }
                    
                    HStack {
                        Text("Username")
                        
                        Spacer()
                        
                        Text("sachin.randive_01")
                    }
                    
                    HStack {
                        Text("Bio")
                        
                        Spacer()
                        
                        Text("Add a bio")
                    }
                }
                .font(.subheadline)
                .padding()
                Spacer()
            }
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

#Preview {
    EditProfileView()
}
