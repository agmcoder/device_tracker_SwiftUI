//
// Created by agmcoder on 12/4/22.
//


import SwiftUI

struct GPSButtonView: View {
    @StateObject var viewModel : GPSButtonViewModel
    var body: some View {
        VStack {
            Button(
                    action: {
                        //button tapped
                        viewModel.gpsState.toggle()
                        viewModel.show.toggle()

                    }
            ) {
                Image(systemName: "power.circle.fill")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .foregroundColor(viewModel.gpsState ? .green : .red)
                        .scaleEffect(viewModel.show ? 2 : 1)
                        .animation(
                                Animation.easeInOut(duration: 0.5),
                                value: viewModel.show
                        )
            }
        }
    }
}

struct GPSButtonView_Previews: PreviewProvider {
    static var previews: some View {
        GPSButtonView(viewModel:  GPSButtonViewModel())
    }
}

