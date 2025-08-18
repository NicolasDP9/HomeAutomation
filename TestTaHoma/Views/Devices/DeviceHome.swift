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
                List {
                    ForEach(viewModel.sortedFamilyKeys, id: \.self) { family in
                        Section {
                            ForEach(viewModel.getDevices(for: family)) { device in
                                NavigationLink {
                                    viewModel.getDetailView(for: device)
                                } label: {
                                    DeviceRowView(device: device, viewModel: viewModel)
                                }
                            }
                        } header: {
                            Text(family)
                                .font(.subheadline.bold())
                                .foregroundStyle(.primary)
                                .padding(.vertical, 3)
                        }
                    }
                }
            } else {
                ProgressView("Loading...")
            }
        }
        .navigationTitle("Mes équipements")
        .onAppear {
            if viewModel == nil {
                viewModel = DeviceViewModel(modelData: modelData)
            }
        }
    }
}

#Preview {
    DeviceHome()
        .environment(ModelData())
}
