//
//  UploadPostView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 02/02/26.
//

import SwiftUI

struct UploadPostView: View {
    @State private var caption = ""
    var body: some View {
        VStack {
            HStack {
                TextField("Enter ypur caption", text: $caption, axis: .vertical)
                
                Spacer()
                
                Image("tik_user_test")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 88, height: 100)
                    .clipShape(.rect(cornerRadius: 10))
            }
            Divider()
            
            Spacer()
            
            Button {
                print("DEBUG: Upload Post ..")
            } label: {
                Text("Post")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .frame(width: 352, height: 44)
                    .background(Color(.systemPink))
                    .cornerRadius(8)
                    
                
            }
        }
        .padding()
    }
}

#Preview {
    UploadPostView()
}
