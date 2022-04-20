//
//  MessageView.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 17/4/22.
//

import SwiftUI

struct MessageView: View {
    @Environment(\.colorScheme) var colorScheme
    var isFromCurrentUser: Bool
    var messageText: String

    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()


                HStack(alignment: .bottom) {
                    Text(messageText)
                            .font(.system(size: 15))
                            .padding(12)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                            .background(Color.blue)
                            .clipShape(ChatBubble(isFromCurrentUser: true))
                }
                        .padding(.horizontal)
                        .padding(.leading, 80)

            } else {
                HStack(alignment: .bottom) {
                    //image person systemImage"
                    Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                    Text(messageText)
                            .font(.system(size: 15))
                            .padding(12)
                            .background(Color(.systemGray6))
                            .clipShape(ChatBubble(isFromCurrentUser: false))
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
                        .padding(.horizontal, 8)
                        .padding(.trailing, 50)
                Spacer()
            }

        }
    }
}

struct MessageView_Previews: PreviewProvider {
    static var previews: some View {
        MessageView(isFromCurrentUser: false, messageText: "hei, how are you my friend?")
    }
}
