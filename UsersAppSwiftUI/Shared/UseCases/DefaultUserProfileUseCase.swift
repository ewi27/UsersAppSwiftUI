//
//  DefaultUserProfileUseCase.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 11/03/2024.
//

import Foundation

protocol UserProfileUseCase {
    func saveUserProfileToDatabase(user: UserProfile) async throws
    func getUserProfile(userId: String) async throws -> UserProfile
}

final class DefaultUserProfileUseCase: UserProfileUseCase {
    
    private let repository: UserProfileDatabaseRepository
    
    init(repository: UserProfileDatabaseRepository = DefaultUserProfileDatabaseRepository()) {
        self.repository = repository
    }
    
    func saveUserProfileToDatabase(user: UserProfile) async throws {
        try await repository.createUser(user: user)
    }
    
    func getUserProfile(userId: String) async throws -> UserProfile {
        try await repository.getUserFromDatabase(id: userId)
    }
}
