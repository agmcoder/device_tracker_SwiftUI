//
//  CustomSecureField.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 12/4/22.
//

import SwiftUI

struct CustomSecureField: View {
    @Binding var text:String
    @Binding var isPasswordVisible:Bool

    var body: some View {
        VStack{
            HStack{
                
                if(isPasswordVisible){
                    Image(systemName: "lock.unlock").foregroundColor(.blue)
                    TextField("Password",text: $text)
                }else{
                    Image(systemName: "lock").foregroundColor(.gray)
                    SecureField("Password",text: $text)
                }
                
            }
        }
    }
    
}

