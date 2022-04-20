//
//  UserCell.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 16/4/22.
//

import SwiftUI

struct UserCell: View {
    // MARK: - Properties
    //colorScheme
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        VStack {
            HStack {
                //user image
                Image(systemName: "person.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
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
                    Text("Status")
                            .font(.subheadline)
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                }
                Spacer()
            }
                    .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    .padding(.top)
            Divider()

        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
