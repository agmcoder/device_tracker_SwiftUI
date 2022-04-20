//
//  NewMessageView.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 16/4/22.
//

import SwiftUI

struct NewMessageView: View {
    @ObservedObject var viewModel = NewMessageViewModel()
    @Binding var showChatView: Bool
    @Environment(\.presentationMode) var mode

    var body: some View {

        ScrollView {
            SearchBar( text:$viewModel.searchBarText,
                       isEditing: $viewModel.isEditingSearchBar)
            .onTapGesture {
                viewModel.isEditingSearchBar.toggle()
            }

            LazyVStack {
                ForEach((1...20), id: \.self) { _ in
                    Button(
                            action: {
                                showChatView.toggle()
                                mode.wrappedValue.dismiss()
                            },
                            label: {
                                UserCell()
                            }
                    )
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView(showChatView: .constant(true))
    }
}
