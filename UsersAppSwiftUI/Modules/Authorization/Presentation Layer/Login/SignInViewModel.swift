//
//  SignInViewModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import Foundation

final class SignInViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    private let useCase: AuthenticationUseCase
    
    init(useCase: AuthenticationUseCase = DefaultAuthenticationUseCase()) {
        self.useCase = useCase
    }
    
    func signIn() async throws {
        try await useCase.signIn(email: email, password: password)
    }
}
