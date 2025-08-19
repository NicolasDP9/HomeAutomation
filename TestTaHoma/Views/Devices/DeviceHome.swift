//
//  DeviceHome.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 31/07/2025.
//

import SwiftUI

struct DeviceHome: View {
    var body: some View {
        DeviceHomeContent()
    }
}

struct DeviceHomeContent: View {
    @Environment(ModelData.self) var modelData
    @State private var viewModel: DeviceViewModel?
    
    var body: some View {
        Group {
            if let viewModel = viewModel {
                ScrollView {
                    VStack(spacing: 24) {
                        DevicesStatsView(viewModel: viewModel)
                        DevicesFamiliesView(viewModel: viewModel)
                        Spacer()
                    }
                    .padding()
                }
                .background(Color(.systemGroupedBackground))
            } else {
                VStack(spacing: 20) {
                    ProgressView()
                        .scaleEffect(1.2)
                    
                    Text("Chargement des équipements...")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color(.systemGroupedBackground))
            }
        }
        .navigationTitle("Mes équipements")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            if viewModel == nil {
                viewModel = DeviceViewModel(modelData: modelData)
            }
        }
    }
}

// MARK: - Devices Stats
struct DevicesStatsView: View {
    let viewModel: DeviceViewModel
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                Text("Vue d'ensemble")
                    .font(.headline)
                    .fontWeight(.semibold)
                Spacer()
            }
            .padding(.horizontal, 4)
            
            HStack(spacing: 16) {
                StatCardView(
                    title: "Total",
                    value: "\(viewModel.totalDevicesCount)",
                    icon: "house.fill",
                    color: .blue
                )
                
                StatCardView(
                    title: "Actifs",
                    value: "\(viewModel.activeDevicesCount)",
                    icon: "power",
                    color: .green
                )
                
                StatCardView(
                    title: "Types",
                    value: "\(viewModel.deviceTypesCount)",
                    icon: "square.grid.2x2.fill",
                    color: .purple
                )
            }
        }
    }
}

// MARK: - Devices Families
struct DevicesFamiliesView: View {
    let viewModel: DeviceViewModel
    
    var body: some View {
        VStack(spacing: 20) {
            ForEach(viewModel.sortedFamilyKeys, id: \.self) { family in
                DeviceFamilySection(
                    family: family,
                    devices: viewModel.getDevices(for: family),
                    viewModel: viewModel
                )
            }
        }
    }
}

// MARK: - Device Family Section
struct DeviceFamilySection: View {
    let family: String
    let devices: [Device]
    let viewModel: DeviceViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack(spacing: 8) {
                Image(systemName: iconForFamily(family))
                    .foregroundColor(colorForFamily(family))
                    .font(.headline)
                
                Text(displayNameForFamily(family))
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Text("\(devices.count)")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color(.tertiarySystemFill))
                    .cornerRadius(6)
            }
            .padding(.horizontal, 4)
            
            VStack(spacing: 12) {
                ForEach(devices) { device in
                    NavigationLink(destination: 
                        viewModel.getDetailView(for: device)
                            .toolbar(.hidden, for: .tabBar)
                    ) {
                        DeviceRowView(device: device, viewModel: viewModel)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
        }
    }
    
    private func displayNameForFamily(_ family: String) -> String {
        switch family {
        case "RollerShutter": return "Volets roulants"
        case "HeatingSystem": return "Système de chauffage"
        default: return family
        }
    }
    
    private func iconForFamily(_ family: String) -> String {
        switch family {
        case "RollerShutter": return "window.shade.closed"
        case "HeatingSystem": return "thermometer.medium"
        default: return "gear"
        }
    }
    
    private func colorForFamily(_ family: String) -> Color {
        switch family {
        case "RollerShutter": return .blue
        case "HeatingSystem": return .orange
        default: return .gray
        }
    }
}

// MARK: - Stat Card
struct StatCardView: View {
    let title: String
    let value: String
    let icon: String
    let color: Color
    
    var body: some View {
        VStack(spacing: 8) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(color.opacity(0.15))
                    .frame(width: 40, height: 40)
                
                Image(systemName: icon)
                    .foregroundColor(color)
                    .font(.system(size: 18, weight: .medium))
            }
            
            Text(value)
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(.primary)
            
            Text(title)
                .font(.caption)
                .foregroundColor(.secondary)
                .fontWeight(.medium)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    DeviceHome()
        .environment(ModelData())
}
