//
//  Device.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 31/07/2025.
//

import Foundation

struct Device: Codable, Hashable, Identifiable {
    let creationTime: Int
    let lastUpdateTime: Int
    let label: String
    let deviceURL: String?
    let shortcut: Bool
    let controllableName: String
    let available: Bool
    let enabled: Bool
    let placeOID: String
    let widget: String
    let type: Int
    let oid: String
    var id: String {oid}
    let uiClass: String
}

