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

    @Published var isLoggingIn = false

    //Error alerts
    @Published var userNameError: String?
    @Published var passwordError: String?
    @Published var alert=false
    @Published var alertMessage:String?

    @Published private(set) var gpsState=false

    init(){
        //self.userSession=Auth.auth().currentUser
    }
    func loginEmailPasswordViewModel(){
        //call loginEmailPasswordViewModel
        // let auth=AuthenticationService()
        //auth.loginEmailPasswordService(email: userNameValue, password: passwordValue)
        return
    }

    func loadGPSState(){

    }
}


