//
//  NotificationCell.swift
//  TikTokTutorialPro
//
//  Created by Sachin Randive on 20/01/26.
//

import SwiftUI

struct NotificationCell: View {
    var body: some View {
        HStack {
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundStyle(Color(.systemGray5))
            
            HStack {
                Text("Max.verstason ")
                    .font(.footnote)
                    .fontWeight(.semibold) +
                
                Text("just now like your one of the post ")
                    .font(.footnote) +
                
                Text(" 1h")
                    .font(.footnote)
                    .foregroundStyle(.gray)
            }
            Spacer()
            Rectangle()
                .frame(width: 48, height: 48)
                .clipShape(RoundedRectangle(cornerRadius: 6))
        }
        .padding(.horizontal)
    }
}

#Preview {
    NotificationCell()
}
