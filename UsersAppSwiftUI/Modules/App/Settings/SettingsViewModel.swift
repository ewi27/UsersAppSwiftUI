//
//  SettingsViewModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import Foundation

final class SettingsViewModel: ObservableObject {
    
    private let useCase: AuthenticationUseCase
    
    init(useCase: AuthenticationUseCase = DefaultAuthenticationUseCase()) {
        self.useCase = useCase
    }
    
    func signOut() throws {
        try useCase.signOut()
    }
}
