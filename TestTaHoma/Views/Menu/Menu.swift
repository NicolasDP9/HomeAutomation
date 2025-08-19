//
//  Menu.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 31/07/2025.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        MenuContent()
    }
}

struct MenuContent: View {
    @Environment(ModelData.self) var modelData
    @State private var viewModel: UserViewModel?
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                if let user = modelData.users.first {
                    UserQuickProfileView(user: user)
                }
                
                MenuSectionsView(user: modelData.users.first, viewModel: viewModel)
                
                Spacer()
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("Menu")
        .navigationBarTitleDisplayMode(.large)
        .onAppear {
            if viewModel == nil {
                viewModel = UserViewModel(modelData: modelData)
            }
        }
    }
}

// MARK: - User Quick Profile
struct UserQuickProfileView: View {
    let user: User
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [.blue, .purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 60, height: 60)
                    .shadow(color: .blue.opacity(0.3), radius: 8, x: 0, y: 4)
                
                Text("\(user.firstName.prefix(1))\(user.lastName.prefix(1))")
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .foregroundColor(.white)
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text("Bonjour \(user.firstName) !")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text("Bienvenue dans votre espace")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
        }
        .padding(20)
        .background(Color(.systemBackground))
        .cornerRadius(16)
        .shadow(color: .black.opacity(0.05), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Menu Sections
struct MenuSectionsView: View {
    let user: User?
    let viewModel: UserViewModel?
    
    var body: some View {
        VStack(spacing: 20) {
            AccountSection(user: user, viewModel: viewModel)
            DevicesSection()
            SettingsSection()
        }
    }
}

// MARK: - Account Section
struct AccountSection: View {
    let user: User?
    let viewModel: UserViewModel?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Mon compte", icon: "person.fill")
            
            VStack(spacing: 12) {
                if let user = user, let viewModel = viewModel {
                    NavigationLink(destination: 
                        MyAccount(user: user, viewModel: viewModel)
                            .toolbar(.hidden, for: .tabBar)
                    ) {
                        MenuRowView(
                            icon: "person.crop.circle.fill",
                            title: "Profil utilisateur",
                            subtitle: "Gérer mes informations personnelles",
                            iconColor: .blue,
                            showChevron: true
                        )
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                
                MenuRowView(
                    icon: "key.fill",
                    title: "Sécurité",
                    subtitle: "Mot de passe et authentification",
                    iconColor: .orange,
                    showChevron: true
                )
            }
        }
    }
}

// MARK: - Devices Section
struct DevicesSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Équipements", icon: "house.fill")
            
            VStack(spacing: 12) {
                NavigationLink(destination: 
                    Text("My Box View")
                        .toolbar(.hidden, for: .tabBar)
                ) {
                    MenuRowView(
                        icon: "cube.box.fill",
                        title: "Ma TaHoma",
                        subtitle: "Configurer ma box domotique",
                        iconColor: .green,
                        showChevron: true
                    )
                }
                .buttonStyle(PlainButtonStyle())
                
                MenuRowView(
                    icon: "plus.circle.fill",
                    title: "Ajouter un équipement",
                    subtitle: "Connecter un nouvel appareil",
                    iconColor: .purple,
                    showChevron: true
                )
                
                MenuRowView(
                    icon: "chart.bar.fill",
                    title: "Statistiques",
                    subtitle: "Suivre la consommation énergétique",
                    iconColor: .mint,
                    showChevron: true
                )
            }
        }
    }
}

// MARK: - Settings Section
struct SettingsSection: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            SectionHeaderView(title: "Paramètres", icon: "gearshape.fill")
            
            VStack(spacing: 12) {
                MenuRowView(
                    icon: "bell.fill",
                    title: "Notifications",
                    subtitle: "Gérer les alertes et rappels",
                    iconColor: .red,
                    showChevron: true
                )
                
                MenuRowView(
                    icon: "paintbrush.fill",
                    title: "Apparence",
                    subtitle: "Thème et personnalisation",
                    iconColor: .pink,
                    showChevron: true
                )
                
                MenuRowView(
                    icon: "questionmark.circle.fill",
                    title: "Support & Aide",
                    subtitle: "FAQ et assistance technique",
                    iconColor: .indigo,
                    showChevron: true
                )
            }
        }
    }
}

// MARK: - Reusable Components
struct MenuRowView: View {
    let icon: String
    let title: String
    let subtitle: String
    let iconColor: Color
    let showChevron: Bool
    
    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(iconColor.opacity(0.15))
                    .frame(width: 44, height: 44)
                
                Image(systemName: icon)
                    .foregroundColor(iconColor)
                    .font(.system(size: 20, weight: .medium))
            }
            
            VStack(alignment: .leading, spacing: 4) {
                Text(title)
                    .font(.body)
                    .fontWeight(.semibold)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            
            Spacer()
            
            if showChevron {
                Image(systemName: "chevron.right")
                    .foregroundColor(.teal)
                    .font(.system(size: 14, weight: .medium))
            }
        }
        .padding(16)
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: .black.opacity(0.05), radius: 2, x: 0, y: 1)
    }
}

#Preview {
    Menu()
        .environment(ModelData())
}
