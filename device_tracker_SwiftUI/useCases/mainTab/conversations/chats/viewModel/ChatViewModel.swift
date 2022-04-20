//
//  ChatViewModel.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 17/4/22.
//

import SwiftUI

class ChatViewModel: ObservableObject {
    @Published var customInputViewText = ""
    @Published var messages = [Message]()
    var mockMessages: [Message] {
        [
            .init(isFromCurrentUser: true, messsageText: "Hello, how are you?"),
            .init(isFromCurrentUser: true, messsageText: "Hello, how are you?"),
            .init(isFromCurrentUser: true, messsageText: "Hello, how are you?"),
            .init(isFromCurrentUser: false, messsageText: "Hello, how are you?"),
            .init(isFromCurrentUser: false, messsageText: "Hello, how are you?"),
            .init(isFromCurrentUser: true, messsageText: "Hello, how are you?"),
            .init(isFromCurrentUser: false, messsageText: "Hello, how are you?"),
            .init(isFromCurrentUser: true, messsageText: "Hello, how are you?")

        ]
    }
    init() {
        messages = mockMessages
    }
    func sendMessage(_ messageText: String){
        let message=Message(isFromCurrentUser: true, messsageText: messageText)
        messages.append(message)
    }

}
