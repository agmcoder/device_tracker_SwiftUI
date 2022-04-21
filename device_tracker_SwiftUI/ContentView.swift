//
//  ContentView.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 12/4/22.
//
//

import SwiftUI
import CoreData

struct ContentView : View{
    @EnvironmentObject var authViewModel : AuthViewModel
    var body: some View {
        Group{
            if authViewModel.userSession != nil{
                MainTabView()
            }else{
                LoginView()
            }
        }
    }
}
