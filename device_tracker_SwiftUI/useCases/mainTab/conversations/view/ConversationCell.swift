//
// Created by agmcoder on 16/4/22.
//

import Foundation
import SwiftUI

// MARK: - UserCell
struct ConversationCell: View {
//color scheme environmentObject
    @Environment(\.colorScheme) var colorScheme: ColorScheme

    var body: some View {
        VStack {
            HStack {
                //user image
                Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .scaledToFill()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                        .shadow(radius: 10)
                //user info chat
                VStack(alignment: .leading) {
                    Text("User")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    Text("Last message")
                            .font(.subheadline)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
                Spacer()
            }
                    .padding(.top)
            Divider()

        }
    }
}

// MARK: - UserCell_Previews
struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
