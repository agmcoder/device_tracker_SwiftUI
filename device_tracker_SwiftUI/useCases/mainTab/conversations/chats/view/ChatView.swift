//
//  ChatView.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 16/4/22.
//

import SwiftUI

struct ChatView: View {
    @ObservedObject var viewModel = ChatViewModel()
    var body: some View {

        VStack {
            ScrollView {
                LazyVStack {
                    ForEach((viewModel.messages)) { message in
                        MessageView(isFromCurrentUser: message.isFromCurrentUser,
                                messageText: message.messsageText)
                    }
                }
                        .navigationTitle("Nombre del usuario")
                        .navigationBarTitleDisplayMode(.inline)
                        .padding(.top)
            }
            CustomInputView(text: $viewModel.customInputViewText, action: sendMessage)
        }
    }

    func sendMessage() {
        viewModel.sendMessage(viewModel.customInputViewText)
        viewModel.customInputViewText = ""
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(viewModel: ChatViewModel())
    }
}
