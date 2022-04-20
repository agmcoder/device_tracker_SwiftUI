//
// Created by agmcoder on 12/4/22.
//

import SwiftUI

struct MainTabView: View {
    @StateObject var buttonViewModel = GPSButtonViewModel()
    @ObservedObject private var viewModel = MainTabViewModel()
    
    var body: some View {
        NavigationView {

            TabView(selection: $viewModel.selectedIndex) {
                // view where is the button which activates the service
                GPSButtonView(viewModel: buttonViewModel)
                        .onTapGesture {
                            viewModel.selectedIndex = 0
                        }
                        .tabItem {
                            Image(systemName: "playpause")
                        }
                        .tag(0)
                //view where is the map view
                Text("Map")
                        .onTapGesture {
                            viewModel.selectedIndex = 1
                        }
                        .tabItem {
                            Image(systemName: "map")
                        }
                        .tag(1)
                ConversationsView() // view where is the list of conversations
                        .onTapGesture {
                            viewModel.selectedIndex = 2
                        }
                        .tabItem {
                            Image(systemName: "bubble.left.and.bubble.right")
                        }
                        .tag(2)
                SettingsView()
                        .onTapGesture {
                            viewModel.selectedIndex = 3
                        }
                        .tabItem {
                            Image(systemName: "gear.circle")
                        }
                        .tag(3)
            }
                    .navigationTitle(viewModel.tabTitle)
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}

