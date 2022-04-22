//
// Created by agmcoder on 12/4/22.
//


import SwiftUI

struct SettingsView: View {
    private let user:User
    init(user:User){

    }
    var body: some View {

        ZStack {
            Color(.systemGroupedBackground)
                    .ignoresSafeArea()
            VStack(spacing: 32) {
                SettingsHeader(user:user)
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


