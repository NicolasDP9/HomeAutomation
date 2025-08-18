//
//  DeviceRowView.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 18/08/2025.
//

import SwiftUI

struct DeviceRowView: View {
    let device: Device
    let viewModel: DeviceViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(viewModel.getDisplayName(for: device))
                    .font(.headline)
                Text(viewModel.getDisplayURL(for: device))
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 2)
    }
}

#Preview {
    DeviceRowView(
        device: Device(
            creationTime: 1693919368000,
            lastUpdateTime: 1693919368000,
            label: "Test Device",
            deviceURL: "io://test",
            shortcut: false,
            controllableName: "TestComponent",
            available: true,
            enabled: true,
            placeOID: "test",
            widget: "TestWidget",
            type: 1,
            oid: "test-oid",
            uiClass: "RollerShutter"
        ),
        viewModel: DeviceViewModel(modelData: ModelData())
    )
}