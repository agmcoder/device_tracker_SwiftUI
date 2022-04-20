//
// Created by agmcoder on 16/4/22.
//

import Foundation
import SwiftUI

//create a conversations view struct swifui as whatsapp style
struct ConversationsView: View {
    @ObservedObject var viewModel = ConversationsViewModel()
    var body: some View {
        //create a list of conversations
        VStack {
            ZStack(alignment: .bottomTrailing) {
                NavigationLink(
                        destination: ChatView(),
                        isActive: $viewModel.showChatView,
                        label: {

                        }
                )
                //chat list
                ScrollView {
                    LazyVStack {
                        //create a foreach of 10 objects of conversationCell
                        ForEach((0...20), id: \.self) { _ in
                            NavigationLink(
                                    destination: ChatView(),
                                    label: {
                                        ConversationCell()
                                    }
                            )
                        }


                    }
                }
                //new floating chat button
                Button(

                        action: {
                            viewModel.showNewMessageView.toggle()
                        }
                        ,
                        label: {
                            Image(systemName: "square.and.pencil")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 24, height: 24)
                                    .padding()
                        }
                )
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .clipShape(Circle())
                        .padding()
                        .sheet(
                                isPresented: $viewModel.showNewMessageView,
                                content: { NewMessageView(showChatView: $viewModel.showChatView) }
                        )

            }
        }
    }
}

//preview ConversationsView
struct ConversationsView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationsView()
    }
}

