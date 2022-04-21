//
// Created by agmcoder on 20/4/22.
//

import Foundation

import SwiftUI

struct ProfilePhotoView: View {
    @EnvironmentObject var authViewModel: AuthViewModel
    @State private var imagePickerPresented = false
    @State private var selectedImage: UIImage?
    @State private var profileImage: Image?

    var body: some View {




            VStack {

                NavigationLink(
                    destination: MainTabView()
                            .navigationBarHidden(true)
                            .navigationBarBackButtonHidden(true),
                    isActive: $authViewModel.didUpdatePhotoProfileView,
                    label: {}
            )


                Button(action: {
                    imagePickerPresented.toggle()
                }, label: {
                    if let profileImage = profileImage {
                        profileImage
                                .resizable()
                                .scaledToFill()
                                .frame(width: 180, height: 180)
                                .clipShape(Circle())

                    } else {
                        Image(systemName: "person.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 200, height: 200)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                .shadow(radius: 10)
                    }
                })
                        .sheet(
                                isPresented: $imagePickerPresented,
                                onDismiss: loadImage,
                                content: {
                                    ImagePicker(image: $selectedImage)
                                })
                Text(profileImage == nil ? "select a profile photo" : "Great, tap below2 to continue")
                        .font(.system(size: 20, weight: .semibold))

                if let image = selectedImage {
                    Button(action: {
                        print("button continue tapped")
                        authViewModel.uploadProfileImage(image)
                    },
                            label: {
                                Text("Continue...")
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(width: 340, height: 50)
                                        .background(Color.blue)
                                        .clipShape(Capsule())
                                        .padding()


                            })
                            .padding(.top, 24)
                }
                Spacer()

            }
        }


    func loadImage() {
        guard let selectedImage = selectedImage else {
            return
        }
        profileImage = Image(uiImage: selectedImage)
    }
}