//
//  AuthenticationRepository.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

protocol AuthenticationRepository {
    func getCurrenUser() throws -> AuthUserResult
    func createUser(email: String, password: String) async throws -> AuthUserResult
    func signIn(email: String, password: String) async throws -> AuthUserResult
    func signOut() throws
    func resetPassword(with email: String) async throws
}
