//
// Created by agmcoder on 14/4/22.
//

import Foundation
import SwiftUI

// MARK: - EditProfileViewModel with a var named fullName
class EditProfileViewModel: ObservableObject {
    @Published var fullName: String="Edie Brock"
    @Published var showImagePicker=false
    @Published var selectedImage: UIImage?
    //profile image
    @Published var profileImage: Image?

}

