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
        ScrollView {
            VStack(spacing: 24) {
                ValveHeaderView(device: device, temperature: temperature, devicePower: devicePower)
                PowerControlSection(devicePower: $devicePower)
                TemperatureControlSection(temperature: $temperature, devicePower: devicePower)
                DeviceInfoSection(device: device)
                Spacer()
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(device.label)
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Valve Header
struct ValveHeaderView: View {
    let device: Device
    let temperature: Double
    let devicePower: Bool
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: devicePower ? [.orange, .red] : [.gray, .secondary],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                    .shadow(color: devicePower ? .orange.opacity(0.3) : .gray.opacity(0.3), radius: 10, x: 0, y: 5)
                
                Image(systemName: "thermometer.medium")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Température actuelle")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("\(temperature, specifier: "%.1f")°C")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(devicePower ? .green : .red)
                        .frame(width: 8, height: 8)
                    
                    Text(devicePower ? "Activé" : "Désactivé")
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(devicePower ? .green : .red)
                }
            }
            
            Spacer()
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Power Control Section
struct PowerControlSection: View {
    @Binding var devicePower: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Alimentation", icon: "power")
            
            PowerToggleCard(devicePower: $devicePower)
        }
    }
}

// MARK: - Temperature Control Section
struct TemperatureControlSection: View {
    @Binding var temperature: Double
    let devicePower: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Contrôle de température", icon: "thermometer.medium")
            
            VStack(spacing: 16) {
                TemperatureSliderCard(temperature: $temperature, devicePower: devicePower)
                QuickTemperatureButtons(temperature: $temperature, devicePower: devicePower)
            }
        }
    }
}

// MARK: - Device Info Section
struct DeviceInfoSection: View {
    let device: Device
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Informations de l'équipement", icon: "info.circle.fill")
            
            ModernDeviceInfoCard(device: device)
        }
    }
}

// MARK: - Power Toggle Card
struct PowerToggleCard: View {
    @Binding var devicePower: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill((devicePower ? Color.green : Color.gray).opacity(0.15))
                    .frame(width: 44, height: 44)
                
                Image(systemName: devicePower ? "power.circle.fill" : "power.circle")
                    .foregroundColor(devicePower ? .green : .gray)
                    .font(.system(size: 20, weight: .medium))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("État de l'équipement")
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(devicePower ? "Système de chauffage actif" : "Système arrêté")
                    .font(.caption)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Toggle("", isOn: $devicePower)
                .labelsHidden()
                .tint(.green)
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

// MARK: - Temperature Slider Card
struct TemperatureSliderCard: View {
    @Binding var temperature: Double
    let devicePower: Bool
    
    var body: some View {
        VStack(spacing: 16) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.orange.opacity(0.15))
                        .frame(width: 44, height: 44)
                    
                    Image(systemName: "slider.horizontal.3")
                        .foregroundColor(.orange)
                        .font(.system(size: 20, weight: .medium))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Température cible")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text("Ajustez la température souhaitée")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text("\(temperature, specifier: "%.1f")°C")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.orange)
            }
            
            VStack(spacing: 12) {
                Slider(value: $temperature, in: 5...30, step: 0.5)
                    .tint(.orange)
                    .disabled(!devicePower)
                
                HStack {
                    Text("5°C")
                        .font(.caption2)
                        .foregroundColor(.teal)
                    
                    Spacer()
                    
                    Text("30°C")
                        .font(.caption2)
                        .foregroundColor(.teal)
                }
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        .opacity(devicePower ? 1.0 : 0.6)
    }
}

// MARK: - Quick Temperature Buttons
struct QuickTemperatureButtons: View {
    @Binding var temperature: Double
    let devicePower: Bool
    
    let quickTemperatures = [16.0, 18.0, 20.0, 22.0, 24.0]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Températures rapides")
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            
            HStack(spacing: 8) {
                ForEach(quickTemperatures, id: \.self) { temp in
                    Button(action: {
                        if devicePower {
                            temperature = temp
                        }
                    }) {
                        Text("\(Int(temp))°")
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(temperature == temp ? .white : .orange)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 8)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(temperature == temp ? Color.orange : Color.orange.opacity(0.1))
                            )
                    }
                    .disabled(!devicePower)
                }
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
        .opacity(devicePower ? 1.0 : 0.6)
    }
}

// MARK: - Modern Device Info Card
struct ModernDeviceInfoCard: View {
    let device: Device
    
    var body: some View {
        VStack(spacing: 12) {
            InfoRowView(
                icon: "tag.fill",
                title: "Nom de l'équipement",
                value: device.label,
                iconColor: .blue
            )
            
            InfoRowView(
                icon: "cube.box.fill",
                title: "Type de contrôleur",
                value: device.widget,
                iconColor: .purple
            )
            
            InfoRowView(
                icon: device.available ? "checkmark.circle.fill" : "xmark.circle.fill",
                title: "Disponibilité",
                value: device.available ? "Disponible" : "Indisponible",
                iconColor: device.available ? .green : .red
            )
            
            if let deviceURL = device.deviceURL {
                InfoRowView(
                    icon: "link.circle.fill",
                    title: "Adresse réseau",
                    value: deviceURL,
                    iconColor: .teal
                )
            }
        }
    }
}

#Preview {
    ValveSteeringCard(device: ModelData().devices[1])
}
