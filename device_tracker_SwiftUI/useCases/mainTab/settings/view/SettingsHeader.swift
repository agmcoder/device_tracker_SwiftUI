//
// Created by agmcoder on 12/4/22.
//

import SwiftUI
import Kingfisher

struct SettingsHeader: View {
    private let user:User
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var viewModelStatus = StatusSelectorViewModel()
    @ObservedObject var editProfileViewModel=EditProfileViewModel()
    init(user:User){
        self.user=user
    }
    

    var body: some View {

        NavigationLink(destination:EditProfileView()
            .environmentObject(editProfileViewModel)
            .environmentObject(viewModelStatus)
) {


            HStack {
                if let profileImage =
                user.profileImageURL {
                    KFImage(URL(string:profileImage))
                            .resizable()
                            .frame(width: 64, height: 64)
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                } else {
                    Image(systemName: "person.circle")
                            .resizable()
                            .frame(width: 64, height: 64)
                            .scaledToFill()
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                }
                VStack(alignment: .leading, spacing: 4) {
                    Text(user.email)
                            .font(.system(size: 18))
                    Text(viewModelStatus.currentStatus.title)
                            .font(.system(size: 14))
                            .foregroundColor(.gray)
                }
                Spacer()
            }
                    .frame(height: 80)
                    .padding(.leading)

                    .background(colorScheme == .light ? .white : Color(UIColor.darkGray))
        }

    }

}


