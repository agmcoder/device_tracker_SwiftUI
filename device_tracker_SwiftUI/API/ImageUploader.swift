//
// Created by agmcoder on 21/4/22.
//

import Foundation
import Firebase
import UIKit
import FirebaseStorage
//struc ImageUploader to firebase storage and upload image
struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping (String)-> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {return}
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profileImages/\(filename)")

        ref.putData(
                 imageData,
                metadata:nil)    { (metadata, error) in
            if let error = error {
                print("Error uploading: \(error)")
                return
            }
            ref.downloadURL { (url, error) in
                guard let downloadURL = url?.absoluteString else {
                    print("Error getting download url: \(error!)")
                    return
                }
                completion(downloadURL)
            }
        }

    }




}