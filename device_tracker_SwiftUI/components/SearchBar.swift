//
//  SwiftUIView.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 16/4/22.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @Binding var isEditing: Bool
    let secondaryColor: Color = .secondary

    //color scheme
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
//searchbar
        HStack {
            Image(systemName: "magnifyingglass")
            TextField("Search", text: $text)
                    .padding(8)
                    .padding(.horizontal, 28)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .animation(.default)
            //if isEditing is true, show the cancel button
            if isEditing {
                Button(action: {
                    text = ""
                    isEditing = false
                    // Dismiss the keyboard
                    UIApplication.shared.onEditting()
                },
                        label: {
                            Text("Cancel")
                                    .foregroundColor(colorScheme == .light ? Color.black : Color.white)
                        }
                )
                        .padding(.trailing, 8)
                        .transition(.move(edge: .trailing))
                        .animation(.default)


            }

        }
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
    }
}


struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("Search..."), isEditing: .constant(true))
    }
}
