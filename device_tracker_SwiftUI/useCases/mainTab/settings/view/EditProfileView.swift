//
// Created by agmcoder on 13/4/22.
//

import Foundation

import SwiftUI

//struct swifui to edit profile view
struct EditProfileView: View {
    @EnvironmentObject var editProfileViewModel: EditProfileViewModel
    @EnvironmentObject var viewModelStatus: StatusSelectorViewModel
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        //Color(UIColor.systemIndigo).ignoresSafeArea()
        ZStack {
            Color(.systemGroupedBackground)
                    .ignoresSafeArea()

            VStack(alignment: .leading, spacing: 50) {
                //headers
                VStack {
                    //photo / edit button /text
                    HStack {
                        //photo / edit button
                        VStack {
                            if let profileImage =
                            editProfileViewModel.profileImage {
                                profileImage
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                        .shadow(radius: 10)
                            } else {
                                Image(systemName: "person.circle")
                                        .resizable()
                                        .frame(width: 64, height: 64)
                                        .scaledToFill()
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                                        .shadow(radius: 10)
                            }

                            Button(
                                    action: {
                                        //edit button
                                        editProfileViewModel
                                                .showImagePicker.toggle()
                                    },
                                    label: {
                                        Text("Edit")
                                                .font(.headline)
                                                .foregroundColor(.blue)
                                    }
                            )
                                    .sheet(isPresented: $editProfileViewModel.showImagePicker,
                                            onDismiss: loadImage) {
                                        ImagePicker(image: $editProfileViewModel.selectedImage)
                                    }

                        }
                                .padding(.top)
                        Text("enter your name or change your profile pohoto")
                                .font(.system(size: 16))
                                .foregroundColor(.gray)
                                .padding([.bottom, .horizontal])
                                .multilineTextAlignment(.leading)
                    }
                    Divider()
                            .padding(.horizontal)
                            .foregroundColor(Color(UIColor.darkGray))
                    TextField("", text: $editProfileViewModel.fullName)
                            .padding(8)
                            .background(colorScheme == .light ? .white : Color(UIColor.darkGray))


                }
                        .background(colorScheme == .light ? Color.white : Color(UIColor.darkGray))

                //status
                VStack(alignment: .leading) {
                    //status Text
                    Text("Status")
                            .padding()
                            .foregroundColor(.gray)

                    //status
                    NavigationLink(
                        destination: StatusSelectorView( viewModel: viewModelStatus),
                            label: {
                                HStack {
                                    Text(viewModelStatus.currentStatus.title)
                                            .font(.system(size: 16))
                                            .foregroundColor(.gray)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                            .foregroundColor(.gray)
                                }
                                        .padding()
                                        .background(Color(colorScheme == .light ? .white : UIColor.darkGray))
                            }
                    )
                }
                Spacer()
            }
                    .padding(.top, 1)
        }
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarTitle("Edit Profile")
    }


    //func loadImage
    func loadImage() {
        guard editProfileViewModel.selectedImage != nil else {
            return
        }
        editProfileViewModel.profileImage = Image(uiImage: editProfileViewModel.selectedImage!)
    }
}

//preview
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        
        EditProfileView()
    }
}
