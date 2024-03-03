//
//  AuthenticationUseCase.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import Foundation

protocol AuthenticationUseCase {
    func authenticatedUser() throws -> AuthUserResult
    @discardableResult
    func signUp(email: String, password: String) async throws -> AuthUserResult
    @discardableResult
    func signIn(email: String, password: String) async throws -> AuthUserResult
    func signOut() throws
    func resetPassword(email: String) async throws
}

final class DefaultAuthenticationUseCase: AuthenticationUseCase {
    
    let authRepository: UsersAuthentication
    
    init(authRepository: UsersAuthentication = AuthenticationRepository()) {
        self.authRepository = authRepository
    }
    
    func authenticatedUser() throws -> AuthUserResult {
        try authRepository.getCurrenUser()
    }
    
    @discardableResult
    func signUp(email: String, password: String) async throws -> AuthUserResult {
        try await authRepository.createUser(email: email, password: password)
    }
    
    @discardableResult
    func signIn(email: String, password: String) async throws -> AuthUserResult {
        try await authRepository.signIn(email: email, password: password)
    }
    
    func signOut() throws {
        try authRepository.signOut()
    }
    
    func resetPassword(email: String) async throws {
        try await authRepository.resetPassword(with: email)
    }
}
