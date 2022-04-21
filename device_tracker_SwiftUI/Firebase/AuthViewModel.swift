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
import UIKit
//import GoogleSignIn


class AuthViewModel: NSObject, ObservableObject {
    @Published var userSession : FirebaseAuth.User?
    @Published var didRegisterUser = false
    @Published var didLoginUser = false
    @Published var didUpdatePhotoProfileView=false
    private var tempCurrentUser:FirebaseAuth.User?

    override init(){
        super.init()
        self.userSession = Auth.auth().currentUser
        self.tempCurrentUser = Auth.auth().currentUser
    }

    func loginEmailPasswordViewModel(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
            if let error = error{
                print(error.localizedDescription)
                return
            }
            guard let user = result?.user else { return }
            self?.userSession=user
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
            self.tempCurrentUser = user
            let data: [String: Any] = ["email": email, "password": password, "user": user.uid]

            let db = Firestore.firestore()
            db.collection("users").document(user.uid).setData(data) { _ in
                print("Document successfully written!")
                self.didRegisterUser = true
                print("didAuthticateUser: \(self.didRegisterUser)")
            }


        }
    }


func uploadProfileImage(_ image: UIImage) {
    print("uploadProfileImage")
    guard let uid=tempCurrentUser?.uid else {return}

    ImageUploader.uploadImage(image:image) { url in
        let db = Firestore.firestore()
        db.collection("users").document(uid).updateData(["profileImageURL": url]){
            err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated with url: \(url)")
                self.didUpdatePhotoProfileView=true
            }
        }
    }
}


func logout() {
    self.userSession = nil
    try? Auth.auth().signOut()
}


}
