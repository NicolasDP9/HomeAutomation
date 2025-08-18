//
//  Device.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 31/07/2025.
//

import Foundation

struct User: Codable {
    let firstName: String
    let lastName: String
    let address: Adress
    let birthDate: Int
}

struct Adress: Codable {
    let postalCode: Int
    let city: String
    let street: String
    let country: String
}
