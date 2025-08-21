//
//  DeviceViewModel.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 18/08/2025.
//

import SwiftUI
import Foundation

@Observable
final class DeviceViewModel {
    
    // MARK: - Properties
    private let modelData: ModelData
    
    // MARK: - Computed Properties
    var deviceFamilies: [String: [Device]] {
        modelData.family
    }
    
    var sortedFamilyKeys: [String] {
        modelData.family.keys.sorted()
    }
    
    var totalDevicesCount: Int {
        modelData.devices.count
    }
    
    var activeDevicesCount: Int {
        modelData.devices.filter { $0.available && $0.enabled }.count
    }
    
    var deviceTypesCount: Int {
        Set(modelData.devices.map { $0.uiClass }).count
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
        return device.deviceURL ?? L10n.na
    }
    
    func getDevices(for family: String) -> [Device] {
        return modelData.family[family] ?? []
    }
    
    // MARK: - Navigation Logic
    @ViewBuilder
    func getDetailView(for device: Device) -> some View {
        switch device.uiClass {
        case L10n.rollerShutter:
            ShutterSteeringCard(device: device)
        case L10n.heatingSystem:
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
            Image(systemName: L10n.Exclamationmark.triangle)
                .font(.system(size: 50))
                .foregroundColor(.orange)
            
            Text(L10n.deviceTypeNotSupported)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(L10n.deviceClass(device.uiClass))
                .font(.subheadline)
                .foregroundColor(.secondary)
            
            Text(device.label)
                .font(.headline)
        }
        .padding()
        .navigationTitle(L10n.unsupportedDevice)
    }
}
