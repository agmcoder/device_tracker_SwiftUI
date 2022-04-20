//
// Created by agmcoder on 19/4/22.
//

import Foundation
import SwiftUI
struct ProfilePhotoSelectorView: View {
    @State var imagePickerPresented = false
    @State var profileImage: Image?
    @State var selectedImage: UIImage?
    @EnvironmentObject var AuthViewMOdel: AuthViewModel

    var body: some View {
        VStack {
            Button(
                    action: {
                        self.imagePickerPresented.toggle()
                    },
                    label: {
                        Text("Select Profile Photo")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(40)
                    }

            )
        }
    }
}

//ProfilePhotoSelectorView
//Language: swift
struct ProfilePhotoSelectorView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePhotoSelectorView()
    }
}