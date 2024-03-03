//
//  SignUpViewModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import Foundation

final class SignUpViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    private let useCase: AuthenticationUseCase
    
    init(useCase: AuthenticationUseCase = DefaultAuthenticationUseCase()) {
        self.useCase = useCase
    }
    
    func signUp() async throws {
        try await useCase.signUp(email: email, password: password)
    }
}
