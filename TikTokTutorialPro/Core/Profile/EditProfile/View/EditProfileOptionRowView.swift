//
//  EditProfileOptionRowView.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 01/02/26.
//

import SwiftUI

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

#Preview {
    EditProfileOptionRowView(option: .username, value: "sachin.randive01")
}
