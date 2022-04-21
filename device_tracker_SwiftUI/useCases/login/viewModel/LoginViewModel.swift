//
// Created by agmcoder on 12/4/22.
//

import Foundation
//import SwiftUI
//import Combine

class LoginViewModel:ObservableObject{
    //@Published var userSession:FirebaseAuth.User?
    @Published var userNameValue = ""
    @Published var passwordValue = ""
    //var to check if the password is visible
    @Published var isPasswordVisible = false


    //Error alerts



    init(){}


    func loadGPSState(){

    }
}


