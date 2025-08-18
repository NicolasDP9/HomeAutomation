//
//  UserViewModel.swift
//  TestTaHoma
//
//  Created by DEL PRATO Nicolas on 18/08/2025.
//

import SwiftUI
import Foundation

@Observable
class UserViewModel {
    
    // MARK: - Properties
    private let modelData: ModelData
    
    //MARK: - Initialization
    init(modelData: ModelData) {
        self.modelData = modelData
    }
    
    //MARK: - User Displayed Logic
    func getDiplayUserName(for user: User) -> String {
        return user.lastName + ", " + user.firstName
    }
    
    func getDiplayUserEmail(for user: User) -> String {
        return user.firstName + "." + user.lastName + "@test.com"
    }
}
