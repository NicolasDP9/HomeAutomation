//
//  SwiftUIView.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 18/08/2025.
//

import SwiftUI

struct DeviceInfoView: View {
    var device: Device
    
    var body: some View {
            Section(header: Text("Device Info").font(.headline)) {
                Label("Label", systemImage: "tag")
                Text(device.label)
                
                Label("Type", systemImage: "cube.box")
                Text(device.controllableName)
                
                Label("Status", systemImage: device.enabled ? "checkmark.circle.fill" : "xmark.circle.fill")
                    .foregroundColor(device.enabled ? .green : .red)
                Text(device.enabled ? "Enabled" : "Disabled")
                    .foregroundColor(device.enabled ? .green : .red)
                
                Label("Device Url", systemImage: "curlybraces")
                Text(device.deviceURL ?? "N/A")
            }

    }
}

#Preview {
    DeviceInfoView(device: ModelData().devices[2])
}
