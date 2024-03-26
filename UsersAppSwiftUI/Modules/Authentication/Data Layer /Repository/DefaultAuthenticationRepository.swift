//
//  DefaultAuthenticationRepository.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import FirebaseAuth

final class DefaultAuthenticationRepository: AuthenticationRepository {
    
    func getCurrenUser() throws -> AuthUserResult {
        guard let user = Auth.auth().currentUser else { throw URLError(.badServerResponse) }
        return AuthUserResult(id: user.uid, email: user.email)
    }
    
    func createUser(email: String, password: String) async throws -> AuthUserResult {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return AuthUserResult(id: result.user.uid, email: result.user.email)
    }
    
    func signIn(email: String, password: String) async throws -> AuthUserResult {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return AuthUserResult(id: result.user.uid, email: result.user.email)
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    func resetPassword(with email: String) async throws {
        try await Auth.auth().sendPasswordReset(withEmail: email)
    }
}
