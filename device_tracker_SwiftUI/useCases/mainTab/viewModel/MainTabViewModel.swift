//
// Created by agmcoder on 12/4/22.
//

import Foundation

class MainTabViewModel: ObservableObject {
    //properties
    @Published var selectedIndex = 0
    var tabTitle: String {
        switch selectedIndex {
        case 0: return "Menu"
        case 1: return "Map"
        case 2: return "Chats"
        case 3: return "Settings"
        default:return ""
        }
    }
}
