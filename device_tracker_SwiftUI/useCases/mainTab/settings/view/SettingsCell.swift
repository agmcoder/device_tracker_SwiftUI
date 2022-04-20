//
// Created by agmcoder on 12/4/22.
//


import SwiftUI
//color scheme
struct SettingsCell: View {
    @Environment(\.colorScheme) var colorScheme:ColorScheme
    let viewModel:SettingsCellViewModel

    var body: some View {
        VStack{
            HStack{
                //image

                Image(systemName: viewModel.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 22, height: 22)
                        .background(viewModel.backgroundColor)
                        .foregroundColor(.white)
                        .cornerRadius(6)
                //name
                Text(viewModel.title)
                        .font(.system(size:15))
                Spacer()
                //arrow
                Image(systemName: "chevron.right")
                        .foregroundColor(.gray)
            }
            //pading top and horizontal
            .padding(.top, 10)
            .padding(.horizontal, 15)
            Divider().padding(.leading)


        }.background(colorScheme == .dark ? Color(UIColor.darkGray) : Color.white)

    }
}


