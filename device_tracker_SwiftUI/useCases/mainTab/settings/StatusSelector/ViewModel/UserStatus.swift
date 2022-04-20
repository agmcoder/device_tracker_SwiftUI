//
// Created by agmcoder on 14/4/22.
//

import Foundation
import SwiftUI

enum UserStatus: Int, CaseIterable {
    //@Published var currentStatus:String=""
    //cases
    case available = 4
    case unavailable = 1
    case away = 2
    case busy = 3
    case dnd = 8
    case offline = 5
    case unknown = 6
    case custom = 7
    case none = 9
    case notConfigured = 0


    var title: String {
        switch self {
        case .available: return "Available"
        case .unavailable:return "unavailable"
        case .away:return "away"
        case .busy:return "busy"
        case .dnd:return "dnd"
        case .offline:return "offline"
        case .unknown:return "unknown"
        case .custom:return "custom"
        case .none:return "none"
        case .notConfigured:return "Click here to update your status"
        }
    }


}

