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
        List {
            if let user = modelData.users.first,
               let viewModel = viewModel {
                NavigationLink(destination: MyAccount(user: user, viewModel: viewModel)) {
                    Label("My Account", systemImage: "person.circle")
                }
            }
            NavigationLink(destination: Text("My Box View")) {
                Label("My Box", systemImage: "shippingbox")
            }
        }
        .navigationTitle("Menu")
        .onAppear {
            if viewModel == nil {
                viewModel = UserViewModel(modelData: modelData)
            }
        }
    }
}

#Preview {
    Menu()
        .environment(ModelData())
}
