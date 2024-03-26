//
//  UserProfileDatabaseRepository.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 11/03/2024.
//

protocol UserProfileDatabaseRepository {
    func createUser(user: UserProfile) async throws
    func getUserFromDatabase(id: String) async throws -> UserProfile
}
