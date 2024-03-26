//
//  DefaultUserProfileDatabaseRepository.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 11/03/2024.
//

import FirebaseFirestore

final class DefaultUserProfileDatabaseRepository: UserProfileDatabaseRepository {
    
    private let databaseManager: UserProfileDatabaseManager
    
    init(dataService: UserProfileDatabaseManager = DefaultUserProfileDatabaseManager()) {
        self.databaseManager = dataService
    }
    
    func createUser(user: UserProfile) async throws {
        let user = DBUserModel(userId: user.userId, email: user.email, dateCreated: Date())
        try await databaseManager.createNewUser(user: user)
    }
    
    func getUserFromDatabase(id: String) async throws -> UserProfile {
        let user = try await databaseManager.getUserFromDatabase(id: id)
        return UserProfile(userId: user.userId, email: user.email, dateCreated: user.dateCreated)
    }
}
