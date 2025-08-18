//
//  ValveSteeringCard.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 31/07/2025.
//

import SwiftUI

struct ValveSteeringCard: View {
        
    var device: Device
    @State var temperature: Double = 20.0
    @State var devicePower: Bool = true

    var body: some View {
        List {
                
                Section(header: Text("Power").font(.headline)) {
                    Toggle(isOn: $devicePower) {
                        Label("Power", systemImage: devicePower ? "power.circle.fill" : "power.circle")
                    }
                    .tint(devicePower ? .green : .gray)
                }
                
                Section(header: Text("Adjust Temperature").font(.headline)) {
                    VStack(alignment: .leading, spacing: 16) {
                        HStack {
                            Image(systemName: "thermometer")
                                .foregroundColor(.orange)
                            Text("\(temperature, specifier: "%.1f")°C")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.blue)
                        }

                        Slider(value: $temperature, in: 5...30, step: 0.5)
                            .tint(.orange)
                            .disabled(!devicePower)

                        Stepper(value: $temperature, in: 5...30, step: 0.5) {
                            Text("Set to \(temperature, specifier: "%.1f")°C")
                        }
                        .disabled(!devicePower)
                    }
                    .padding(.vertical, 8)
                }
                
                DeviceInfoView(device: device)
            }
            .listStyle(.grouped)
            .navigationTitle(device.label)
    }
}

#Preview {
    ValveSteeringCard(device: ModelData().devices[0])
}
