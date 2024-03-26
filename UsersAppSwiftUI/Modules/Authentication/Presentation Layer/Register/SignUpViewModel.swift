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
    private let authenticationUseCase: AuthenticationUseCase
    private let createUserUseCase: UserProfileUseCase
    
    init(authenticationUseCase: AuthenticationUseCase = DefaultAuthenticationUseCase(),
         createUserUseCase: UserProfileUseCase = DefaultUserProfileUseCase()) {
        self.authenticationUseCase = authenticationUseCase
        self.createUserUseCase = createUserUseCase
    }
    
    func signUp() async throws {
        let result = try await authenticationUseCase.signUp(email: email, password: password)
        let user = UserProfile(userId: result.id, email: result.email, dateCreated: Date())
        try await createUserUseCase.saveUserProfileToDatabase(user: user)
    }
}
