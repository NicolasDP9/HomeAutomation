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
        HStack(spacing: 16) {
            DeviceIconView(device: device)
            
            VStack(alignment: .leading, spacing: 4) {
                Text(viewModel.getDisplayName(for: device))
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                    .lineLimit(1)
                
                HStack(spacing: 8) {
                    Text(device.widget)
                        .font(.caption)
                        .foregroundColor(.secondary)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    StatusIndicatorView(device: device)
                }
            }
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.teal)
                .font(.system(size: 14, weight: .medium))
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

// MARK: - Device Icon
struct DeviceIconView: View {
    let device: Device
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(colorForDeviceType(device.uiClass).opacity(0.15))
                .frame(width: 44, height: 44)
            
            Image(systemName: iconForDeviceType(device.uiClass))
                .foregroundColor(colorForDeviceType(device.uiClass))
                .font(.system(size: 20, weight: .medium))
        }
    }
    
    private func iconForDeviceType(_ type: String) -> String {
        switch type {
        case "RollerShutter": return "window.shade.closed"
        case "HeatingSystem": return "thermometer.medium"
        default: return "gear"
        }
    }
    
    private func colorForDeviceType(_ type: String) -> Color {
        switch type {
        case "RollerShutter": return .blue
        case "HeatingSystem": return .orange
        default: return .gray
        }
    }
}

// MARK: - Status Indicator
struct StatusIndicatorView: View {
    let device: Device
    
    var body: some View {
        HStack(spacing: 4) {
            Circle()
                .fill(statusColor)
                .frame(width: 8, height: 8)
            
            Text(statusText)
                .font(.caption2)
                .fontWeight(.medium)
                .foregroundColor(statusColor)
        }
    }
    
    private var statusColor: Color {
        if !device.available {
            return .red
        } else if !device.enabled {
            return .orange
        } else {
            return .green
        }
    }
    
    private var statusText: String {
        if !device.available {
            return "Indisponible"
        } else if !device.enabled {
            return "Désactivé"
        } else {
            return "Actif"
        }
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
