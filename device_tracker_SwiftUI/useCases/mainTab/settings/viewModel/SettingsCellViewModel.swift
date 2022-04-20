//
// Created by agmcoder on 12/4/22.
//
import SwiftUI
import Foundation
enum SettingsCellViewModel:Int, CaseIterable{
    case account=1
    case notification=0
    case about=2


    var title : String{
        switch self {
        case .account:
            return "Account"
         //more cases
        case .notification:
            return "Notification"
        case .about:
            return "About"
        }

        }

    var imageName :String{
        switch self {
        case .account:
            return "key.fill"
        //more cases
        case .notification:
            return "bell.fill"
        case .about:
            return "info.circle.fill"
        }
    }
    var backgroundColor: Color {
        switch self {
        case .account:
            return .blue
        //more cases
        case .notification:
            return .green
        case .about:
            return .red
        }
    }
}