//
// Created by agmcoder on 12/4/22.
//

import SwiftUI

struct CustomAlert: View {
    @State private var showingAlert = false
    var body: some View {
        Button("Show Alert") {
            showingAlert = true
        }
                .alert("Important message", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
    }
}

struct Alert_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlert()
    }
}
