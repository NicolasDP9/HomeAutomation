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
                Label("Devices", systemImage: "house")
            }
            .tag(Tab.devices)
            
            NavigationStack {
                MenuContent()
            }
            .tabItem {
                Label("My account", systemImage: "person.crop.circle.fill")
            }
            .tag(Tab.menu)
        }
    }
}

#Preview {
    ContentView()
        .environment(ModelData())
}
