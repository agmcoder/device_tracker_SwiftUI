//
// Created by agmcoder on 12/4/22.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var registerViewModel = RegisterViewModel()
    @EnvironmentObject var authViewModel: AuthViewModel
    @State var showAlert = false
    @Environment(\.presentationMode) var mode


    var body: some View {
        VStack {
            //navigation to profile selector view
            NavigationLink(
                    destination: ProfilePhotoView()
                            .navigationBarBackButtonHidden(true)
                    ,
                    isActive: $authViewModel.didRegisterUser,
                    label: {}

            )


            Image("logo_firebase").resizable().scaledToFit().frame(width: 100, height: 100)
            Text("SIGN UP").font(.largeTitle).bold()
            VStack(spacing: 40) {
                HStack {
                    CustomTextField(imageName: "person.circle",
                            placeholderText: "Email", text: $registerViewModel.userNameValue)
                }
                HStack {
                    CustomSecureField(text: $registerViewModel.passwordValue,
                            isPasswordVisible: $registerViewModel.isPasswordVisible)

                }
                HStack {
                    CustomSecureField(text: $registerViewModel.rePasswordValue,
                            isPasswordVisible: $registerViewModel.isRePasswordVisible)

                }
            }
                    .padding([.top, .horizontal], 32)


            Button(
                    "Register",
                    action: {
                        //we have to call emailandpassword login function
                        if (isValidEmail(registerViewModel.userNameValue) == true) {
                            print("is valid email")
                            authViewModel.registerEmailPasswordViewModel(
                                    withEmail: registerViewModel.userNameValue,
                                    password: registerViewModel.passwordValue
                            )
                            // if (viewModel.isLoggingIn == true) {
                            // print("is logged in")

                            //}

                        } else {
                            print("is not valid email")
                            showAlert.toggle()
                        }
                    }
            )
                    .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .clipShape(Capsule())
                    .padding()
            // .buttonStyle(GrowingButton())
            Button(
                    action: {
                        //we have to call google login function
                        print("google loggin button tapped")
                    },
                    label: { Image("logo_google").resizable().frame(width: 50, height: 50) }
            )
            //.buttonStyle(GrowingButtonGoogle())
            Spacer()
            Button(action: { mode.wrappedValue.dismiss() },
                    label: {
                        HStack(alignment: .center) {
                            Text("already register?")
                                    .font(.system(size: 13))
                            Text(" Sign In").font(.system(size: 14, weight: .semibold))

                        }


                    }
            )
                    .padding(.bottom, 32)

        }
                .onTapGesture {
                    hideKeyboard()
                }
                .padding(.leading)
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("invalid email"))
                }

    }
}


struct registerScreenView: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

