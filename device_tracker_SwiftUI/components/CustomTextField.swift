//
//  CustomTextField.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 12/4/22.
//

import SwiftUI

struct CustomTextField: View {
    var imageName:String
    var placeholderText:String
    @Binding var text:String
    
    var body: some View {
        VStack{
        HStack{
            Image(systemName: imageName)
            TextField(
                placeholderText,
                text: $text
            )
            Spacer()
            
        }
            Divider()
        }
    }
}

