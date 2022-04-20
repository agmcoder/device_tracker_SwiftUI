//
// Created by agmcoder on 12/4/22.
//

import SwiftUI

struct SettingsHeader: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var viewModelStatus = StatusSelectorViewModel()
    @ObservedObject var editProfileViewModel=EditProfileViewModel()
    

    var body: some View {

        NavigationLink(destination:EditProfileView()
            .environmentObject(editProfileViewModel)
            .environmentObject(viewModelStatus)
) {


            HStack {
                if let profileImage =
                editProfileViewModel.profileImage {
                    profileImage
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
                    Text("alexgmp6")
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

struct SettingsHeader_Previews: PreviewProvider {
    static var previews: some View {
        SettingsHeader()
    }
}
