//
// Created by agmcoder on 12/4/22.
//


import SwiftUI

struct SettingsView: View {
    var body: some View {
        ZStack {
            Color(.systemGroupedBackground)
                    .ignoresSafeArea()
            VStack(spacing: 32) {
                SettingsHeader()
                VStack(spacing: 1) {

                        ForEach(SettingsCellViewModel.allCases, id: \.self) { viewModel in
                            SettingsCell(viewModel: viewModel)

                    }
                }

                LogOut()
                Spacer()
            }.padding(.top,1)
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
