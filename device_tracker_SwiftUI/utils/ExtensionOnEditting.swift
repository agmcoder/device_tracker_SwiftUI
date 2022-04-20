//
// Created by agmcoder on 16/4/22.
//

import Foundation
import UIKit

//extension UIApplication with a function named onEditting
extension UIApplication {
    func onEditting() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}


