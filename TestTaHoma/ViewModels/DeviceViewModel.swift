//
//  DeviceViewModel.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 18/08/2025.
//

import SwiftUI
import Foundation

@Observable
class DeviceViewModel {
    
    // MARK: - Properties
    private let modelData: ModelData
    
    // MARK: - Computed Properties
    var deviceFamilies: [String: [Device]] {
        modelData.family
    }
    
    var sortedFamilyKeys: [String] {
        modelData.family.keys.sorted()
    }
    
    // MARK: - Initialization
    init(modelData: ModelData) {
        self.modelData = modelData
    }
    
    // MARK: - Device Display Logic
    func getDisplayName(for device: Device) -> String {
        return device.label
    }
    
    func getDisplayURL(for device: Device) -> String {
        return device.deviceURL ?? "N/A"
    }
    
    func getDevices(for family: String) -> [Device] {
        return modelData.family[family] ?? []
    }
    
    // MARK: - Navigation Logic
    @ViewBuilder
    func getDetailView(for device: Device) -> some View {
        switch device.uiClass {
        case "RollerShutter":
            ShutterSteeringCard(device: device)
        case "HeatingSystem":
            ValveSteeringCard(device: device)
        default:
            UnsupportedDeviceView(device: device)
        }
    }
}

// MARK: - Unsupported Device View
struct UnsupportedDeviceView: View {
    let device: Device
    
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text("Device Type Not Supported")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("Device class: \(device.uiClass)")
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(device.label)
                .font(.headline)
        }
        .padding()
        .navigationTitle("Unsupported Device")
    }
}