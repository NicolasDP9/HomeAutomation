//
//  ShutterSteeringCard.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 01/08/2025.
//

import SwiftUI

struct ShutterSteeringCard: View {
    
    var device: Device
    @State var opener: Double = 50
    
    var body: some View {
       List {
               Section(header: Text("Adjust opener").font(.headline)) {
                   VStack(alignment: .center, spacing: 16) {
                       HStack {
                           Image(systemName: "window.vertical.open")
                               .foregroundColor(.orange)
                           Text("Open at \(opener, specifier: "%.0f") %")
                               .font(.title3)
                               .bold()
                               .foregroundColor(.blue)
                       }
                       .padding()

                       GeometryReader { geometry in
                           HStack {
                               Spacer()
                               Slider(value: $opener, in: 0...100, step: 1)
                                   .rotationEffect(.degrees(-90))
                                   .frame(height: geometry.size.height * 0.6)
                                   .tint(.orange)
                               Spacer()
                           }
                       }
                       .frame(height: 130)
                       .padding(.vertical, 90)


                       Stepper(value: $opener, in: 0...100, step: 1) {}
                   }
                   .padding(.vertical, 8)
               }

               DeviceInfoView(device: device)
           }
           .navigationTitle(device.label)
   }
}

#Preview {
    ShutterSteeringCard(device: ModelData().devices[2])
}


