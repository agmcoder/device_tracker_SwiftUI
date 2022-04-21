//
// Created by agmcoder on 12/4/22.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    @State var showAlert = false
    @ObservedObject var authViewModel = AuthViewModel()

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                        destination: MainTabView(),
                        isActive: $authViewModel.didAuthticateUser,
                        label: {}

                )


                Image("logo_firebase").resizable().scaledToFit().frame(width: 100, height: 100)
                Text("LOG IN").font(.largeTitle).bold()
                VStack(spacing: 20) {
                    CustomTextField(
                            imageName: "person.circle",
                            placeholderText: "UserName",
                            text: $viewModel.userNameValue

                    )
                    CustomSecureField(
                            text: $viewModel.passwordValue,
                            isPasswordVisible: $viewModel.isPasswordVisible
                    )

                }
                        .padding([.top, .horizontal], 32)

                HStack {
                    Spacer()
                    NavigationLink(
                            destination: Text("Reset Passord..."),
                            label: {
                                Text("Forgot Password?")
                                        .font(.system(size: 13, weight: .semibold))
                                        .padding(.top)
                                        .padding(.trailing, 28)
                                        .foregroundColor(.blue)
                            }
                    )
                }
                Button(
                        "login",
                        action: {
                            //we have to call emailandpassword login function
                            if (isValidEmail(viewModel.userNameValue) == true) {
                                print("is valid email")
                                authViewModel.loginEmailPasswordViewModel(
                                        withEmail: viewModel.userNameValue,
                                        password: viewModel.passwordValue
                                )


                            } else {
                                print("is not valid email")
                                showAlert.toggle()
                            }
                        }
                )
                        .frame(width: UIScreen.main.bounds.width - 32, height: 50)
                        .background(Color.blue)
                        .clipShape(Capsule())
                        .foregroundColor(.white)
                //.buttonStyle(GrowingButton())
                Button(
                        action: {
                            //we have to call google login function
                            print("google loggin button tapped")
                        },
                        label: { Image("logo_google").resizable().frame(width: 50, height: 50) }
                )
                // .buttonStyle(GrowingButtonGoogle())
                Spacer()
                NavigationLink(
                        destination: RegisterView()
                                .navigationBarBackButtonHidden(true)
                                .navigationBarHidden(true),
                        label: {

                            HStack(alignment: .center) {
                                Text("Don´t you have an account?")
                                        .font(.system(size: 13))
                                Text(" Sign Up").font(.system(size: 14, weight: .semibold))
                            }
                        }

                )
                        .padding(.bottom, 32)


            }
                    .navigationBarHidden(true)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("invalid email"))
                    }
        }
                .onTapGesture {
                    hideKeyboard()

                }
    }
}

extension View {
    func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}


struct loginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}



