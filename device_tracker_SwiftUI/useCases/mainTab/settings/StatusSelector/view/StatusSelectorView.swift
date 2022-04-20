//
// Created by agmcoder on 14/4/22.
//

import Foundation
import SwiftUI

// MARK: - StatusSelectorView
//struct StatusSelectorView
struct StatusSelectorView: View {
    // MARK: - Properties
    //@environtment colorScheme
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel:StatusSelectorViewModel



    var body: some View {
        //zstack color systemgroupedbackgroun ignoresSafeArea
        ZStack {
            Color(.systemGroupedBackground).ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    Text("CURRENTLY SET TO")
                            .font(.headline)
                            .padding(.leading)
                            .foregroundColor(.gray)
                    StatusCell(status: viewModel.currentStatus)

                    //status SettingsCell
                    Text("SELECT YOUR STATUS")
                            .font(.headline)
                            .padding(.leading)
                            .foregroundColor(.gray)

                    //for loop with selectable status

                    ForEach(UserStatus.allCases
                            , id: \.self) { status in
                        Button(
                                action: {
                                    viewModel.updateStatus(status:status)
                                },
                                label:{
                                    StatusCell(status: status)
                                }
                        )

                    }

                }
            }
        }
    }
}


struct StatusSelectorview_Previews: PreviewProvider {
    static var previews: some View {
        StatusSelectorView( viewModel: StatusSelectorViewModel())
    }
}


