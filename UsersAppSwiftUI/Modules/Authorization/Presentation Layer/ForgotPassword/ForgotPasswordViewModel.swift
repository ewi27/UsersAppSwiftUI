//
//  ForgotPasswordViewModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 23/02/2024.
//

import Foundation

final class ForgotPasswordViewModel: ObservableObject {
    
    private let useCase: AuthenticationUseCase
    
    init(useCase: AuthenticationUseCase = DefaultAuthenticationUseCase()) {
        self.useCase = useCase
    }
    
    func resetPassword(email: String) async throws {
        try await useCase.resetPassword(email: email)
    }
}
