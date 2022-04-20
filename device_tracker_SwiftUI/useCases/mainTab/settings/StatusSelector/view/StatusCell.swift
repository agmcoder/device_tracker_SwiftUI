//
// Created by agmcoder on 14/4/22.
//

import Foundation
import SwiftUI
//struct status cells
struct StatusCell: View {
    let status:UserStatus
    //environment var colorsqueme
    @Environment(\.colorScheme) var colorScheme


    var body: some View {
        HStack {
            Text(status.title)
                    .foregroundColor(colorScheme == .dark ?
                            .white : .black)

            Spacer()
        }
                .frame(height:56)
                .padding(.horizontal)
                .background(colorScheme == .dark ?
                        Color(UIColor.darkGray) : Color.white)



    }
}
