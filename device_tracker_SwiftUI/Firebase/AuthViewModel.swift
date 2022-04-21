//
//  AuthViewModel.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 18/4/22.
//

import Foundation
import Firebase
import SwiftUI
import FirebaseCore
//import GoogleSignIn


class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthticateUser = false

    func loginEmailPasswordViewModel(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            else{
                self?.didAuthticateUser = true
                print("login with user \(result?.user.email)")
            }
        }

    }

    func registerEmailPasswordViewModel(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else {
                return
            }
            let data: [String: Any] = ["email": email, "password": password, "user": user.uid]

            let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData(data) { _ in
                print("Document successfully written!")
                self.didAuthticateUser = true
                print("didAuthticateUser: \(self.didAuthticateUser)")
            }


        }
    }


func uploadProfileImage(_ image: UIImage) {

}


func logout() {
}


}
