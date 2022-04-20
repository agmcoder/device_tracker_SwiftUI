//
//  AuthViewModel.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 18/4/22.
//

import Foundation
import Firebase
import SwiftUI

class AuthViewModel: NSObject, ObservableObject {
    @Published var didAuthticateUser = false

    func login(username: String, password: String) {

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
                self.didAuthticateUser = true
            }


        }
    }


func uploadProfileImage(_ image: UIImage) {

}


func logout() {
}


}
