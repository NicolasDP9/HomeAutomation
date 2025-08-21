//
//  ContentView.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 31/07/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var selection: Tab = .devices
    enum Tab {
        case devices
        case menu
    }
    
    var body: some View {
        TabView(selection: $selection) {
            NavigationStack {
                DeviceHomeContent()
            }
            .tabItem {
                Label(L10n.devicesTab, systemImage: L10n.House.fill)
            }
            .tag(Tab.devices)
            
            NavigationStack {
                MenuContent()
            }
            .tabItem {
                Label(L10n.myAccountTab, systemImage: L10n.Person.Crop.Circle.fill)
            }
            .tag(Tab.menu)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
