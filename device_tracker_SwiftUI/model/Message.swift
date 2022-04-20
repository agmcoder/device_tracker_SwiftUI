//
// Created by agmcoder on 17/4/22.
//

import Foundation

struct Message:Identifiable {
    let id=NSUUID().uuidString
    let isFromCurrentUser:Bool
    let messsageText:String


}
