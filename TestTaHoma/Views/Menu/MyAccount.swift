//
//  MyAccount.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 31/07/2025.
//

import SwiftUI

struct MyAccount: View {
    let user: User
    let viewModel: UserViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ProfileHeaderView(user: user)
                PersonalInfoSection(user: user, viewModel: viewModel)
                AddressSection(user: user)
                Spacer()
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Mon compte")
        .navigationBarTitleDisplayMode(.large)
    }
}

// MARK: - Profile Header
struct ProfileHeaderView: View {
    let user: User
    
    var body: some View {
        VStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 120, height: 120)
                    .shadow(color: .blue.opacity(0.3), radius: 10, x: 0, y: 5)
                
                Text("\(user.firstName.prefix(1))\(user.lastName.prefix(1))")
                    .font(.system(size: 40, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
            }
            
            VStack(spacing: 4) {
                Text("\(user.firstName) \(user.lastName)")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Membre depuis \(formattedJoinDate)")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
        .padding(.vertical, 20)
    }
    
    private var formattedJoinDate: String {
        let date = Date(timeIntervalSince1970: TimeInterval(user.birthDate / 1000))
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter.string(from: date)
    }
}

// MARK: - Personal Info Section
struct PersonalInfoSection: View {
    let user: User
    let viewModel: UserViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Informations personnelles", icon: "person.fill")
            
            VStack(spacing: 12) {
                InfoRowView(
                    icon: "person.circle.fill",
                    title: "Prénom",
                    value: user.firstName,
                    iconColor: .blue
                )
                
                InfoRowView(
                    icon: "person.badge.minus.fill",
                    title: "Nom",
                    value: user.lastName,
                    iconColor: .green
                )
                
                InfoRowView(
                    icon: "envelope.fill",
                    title: "Email",
                    value: viewModel.getDiplayUserEmail(for: user),
                    iconColor: .orange
                )
            }
        }
    }
}

// MARK: - Address Section
struct AddressSection: View {
    let user: User
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Adresse", icon: "location.fill")
            
            AddressCardView(address: user.address)
        }
    }
}

// MARK: - Reusable Components
struct SectionHeaderView: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack(spacing: 8) {
            Image(systemName: icon)
                .foregroundColor(.accentColor)
                .font(.headline)
            
            Text(title)
                .font(.headline)
                .fontWeight(.semibold)
        }
        .padding(.horizontal, 4)
    }
}

struct InfoRowView: View {
    let icon: String
    let title: String
    let value: String
    let iconColor: Color
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .fill(iconColor.opacity(0.1))
                    .frame(width: 36, height: 36)
                
                Image(systemName: icon)
                    .foregroundColor(iconColor)
                    .font(.system(size: 16, weight: .medium))
            }
            
            VStack(alignment: .leading, spacing: 2) {
                Text(title)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .fontWeight(.medium)
                
                Text(value)
                    .font(.body)
                    .foregroundColor(.primary)
                    .fontWeight(.medium)
            }
            
            Spacer()
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

struct AddressCardView: View {
    let address: Adress
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                ZStack {
                    RoundedRectangle(cornerRadius: 8)
                        .fill(Color.red.opacity(0.1))
                        .frame(width: 36, height: 36)
                    
                    Image(systemName: "house.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 16, weight: .medium))
                }
                
                VStack(alignment: .leading, spacing: 4) {
                    Text("Adresse principale")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.primary)
                    
                    VStack(alignment: .leading, spacing: 2) {
                        Text(address.street)
                            .font(.body)
                            .foregroundColor(.primary)
                        
                        Text("\(address.postalCode) \(address.city)")
                            .font(.body)
                            .foregroundColor(.primary)
                        
                        Text(address.country)
                            .font(.body)
                            .foregroundColor(.secondary)
                            .fontWeight(.medium)
                    }
                }
                
                Spacer()
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    let modelData = ModelData()
    return MyAccount(user: modelData.users[0],
                     viewModel: UserViewModel(modelData: modelData))
}
