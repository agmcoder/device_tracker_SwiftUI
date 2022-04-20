//
//  CustomInputView.swift
//  device_tracker_SwiftUI
//
//  Created by agmcoder on 17/4/22.
//

import SwiftUI

struct CustomInputView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var text:String
    var action:()->Void
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(.separator))
                .frame(width:UIScreen.main.bounds.width,height: 0.75)
            HStack{
            TextField(
                "Message...",
                text:$text
            )
            .textFieldStyle(PlainTextFieldStyle()).multilineTextAlignment(.leading)
            .font(.body)
            .frame(minHeight:30)
                Button(
                    action: {
                        action()
                        
                    },
                    label: {
                        Text("send")
                            .bold()
                            .foregroundColor(colorScheme == .dark ? Color.white : Color.black)
                    }
                )
        }
            .padding(.bottom,8)
            .padding(.horizontal)
                      }
        
    }
}


