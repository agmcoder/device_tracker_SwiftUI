//
// Created by agmcoder on 12/4/22.
//

import SwiftUI
//swiftui view of a logout button how whatsapp settingsCells
struct LogOut: View {
    @EnvironmentObject var authViewModel : AuthViewModel
    @Environment(\.colorScheme) var colorScheme:ColorScheme

    var body: some View {

        Button(action: {
           authViewModel.userSession=nil
            NavigationLink(destination: ContentView(),label:{})
        }) {
            HStack {
                Spacer()
                Text("Log Out").foregroundColor(.red).font(.system(size: 16,weight: .semibold))
                        .frame(width:UIScreen.main.bounds.width,height:50)
                        .background(colorScheme == .dark ? Color(UIColor.darkGray) : Color.white)
                Spacer()
            }
        }
    }
}
