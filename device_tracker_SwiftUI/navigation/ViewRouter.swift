//
// Created by agmcoder on 12/4/22.
//

import Foundation

class ViewRouter : ObservableObject {
    @Published var curentPage : Page = .login


}
enum Page{
    case login
    case register
    case menu
}
