//
//  StatusSelectorViewModel.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 14/4/22.
//

import Foundation
import SwiftUI
class StatusSelectorViewModel : ObservableObject{
    @Published var currentStatus:UserStatus = .notConfigured

    
    func updateStatus(status:UserStatus){
        currentStatus=status
    }
}
