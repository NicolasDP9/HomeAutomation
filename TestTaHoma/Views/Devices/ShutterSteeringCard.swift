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
        ScrollView {
            VStack(spacing: 24) {
                ShutterHeaderView(device: device, opener: opener)
                ShutterControlSection(opener: $opener)
                QuickPositionsSection(opener: $opener)
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

// MARK: - Shutter Header
struct ShutterHeaderView: View {
    let device: Device
    let opener: Double
    
    var body: some View {
        HStack(spacing: 20) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .cyan],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 80, height: 80)
                    .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
                
                Image(systemName: "window.shade.closed")
                    .font(.system(size: 32, weight: .medium))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Position actuelle")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                
                Text("\(Int(opener))%")
                    .font(.system(size: 32, weight: .bold, design: .rounded))
                    .foregroundColor(.primary)
                
                HStack(spacing: 4) {
                    Circle()
                        .fill(statusColor)
                        .frame(width: 8, height: 8)
                    
                    Text(statusText)
                        .font(.caption)
                        .fontWeight(.medium)
                        .foregroundColor(statusColor)
                }
            }
            
            Spacer()
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
    
    private var statusColor: Color {
        if opener == 0 { return .red }
        else if opener == 100 { return .green }
        else { return .orange }
    }
    
    private var statusText: String {
        if opener == 0 { return "Fermé" }
        else if opener == 100 { return "Ouvert" }
        else { return "Partiellement ouvert" }
    }
}

// MARK: - Shutter Control Section
struct ShutterControlSection: View {
    @Binding var opener: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Contrôle de position", icon: "slider.vertical.3")
            
            VStack(spacing: 16) {
                VerticalSliderCard(opener: $opener)
            }
        }
    }
}

// MARK: - Quick Positions Section
struct QuickPositionsSection: View {
    @Binding var opener: Double
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Positions rapides", icon: "rectangle.3.group")
            
            QuickPositionButtons(opener: $opener)
        }
    }
}

// MARK: - Vertical Slider Card
struct VerticalSliderCard: View {
    @Binding var opener: Double
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue.opacity(0.15))
                        .frame(width: 44, height: 44)
                    
                    Image(systemName: "slider.vertical.3")
                        .foregroundColor(.blue)
                        .font(.system(size: 20, weight: .medium))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Contrôle vertical")
                        .font(.body)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    Text("Glissez verticalement pour ajuster")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                
                Spacer()
                
                Text("\(Int(opener))%")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
            }
            
            HStack {
                Spacer()
                
                VStack(spacing: 16) {
                    Text("100%")
                        .font(.caption2)
                        .foregroundColor(.teal)
                    
                    Slider(value: $opener, in: 0...100, step: 1)
                        .rotationEffect(.degrees(-90))
                        .frame(width: 200, height: 40)
                        .tint(.blue)
                    
                    Text("0%")
                        .font(.caption2)
                        .foregroundColor(.teal)
                }
                
                Spacer()
            }
            .frame(height: 240)
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

// MARK: - Quick Position Buttons
struct QuickPositionButtons: View {
    @Binding var opener: Double
    
    let quickPositions: [(name: String, value: Double, icon: String)] = [
        ("Fermé", 0, "rectangle.fill"),
        ("1/4", 25, "rectangle.topthird.inset.filled"),
        ("1/2", 50, "rectangle.center.inset.filled"),
        ("3/4", 75, "rectangle.bottomthird.inset.filled"),
        ("Ouvert", 100, "rectangle")
    ]
    
    var body: some View {
        VStack(spacing: 16) {
            ForEach(0..<quickPositions.count, id: \.self) { index in
                let position = quickPositions[index]
                
                Button(action: {
                    opener = position.value
                }) {
                    HStack(spacing: 16) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 8)
                                .fill(opener == position.value ? Color.blue : Color.blue.opacity(0.1))
                                .frame(width: 36, height: 36)
                            
                            Image(systemName: position.icon)
                                .foregroundColor(opener == position.value ? .white : .blue)
                                .font(.system(size: 16, weight: .medium))
                        }
                        
                        VStack(alignment: .leading, spacing: 2) {
                            Text(position.name)
                                .font(.body)
                                .fontWeight(.semibold)
                                .foregroundColor(.primary)
                            
                            Text("\(Int(position.value))% d'ouverture")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        if opener == position.value {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.blue)
                                .font(.system(size: 20))
                        }
                    }
                    .padding(12)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(opener == position.value ? Color.blue.opacity(0.1) : Color.clear)
                    )
                }
                .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    ShutterSteeringCard(device: ModelData().devices[2])
}


