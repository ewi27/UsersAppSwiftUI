//
//  DefaultSaveUserToDatabaseManager .swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 11/03/2024.
//

import FirebaseFirestore

protocol UserProfileDatabaseManager {
    func createNewUser(user: DBUserModel) async throws
    func getUserFromDatabase(id: String) async throws -> DBUserModel
}

final class DefaultUserProfileDatabaseManager: UserProfileDatabaseManager  {
    
    private let collection = Firestore.firestore().collection("users")
    
    func createNewUser(user: DBUserModel) async throws {
        try collection.document(user.userId).setData(from: user, merge: false)
    }
    
    func getUserFromDatabase(id: String) async throws -> DBUserModel {
        try await collection.document(id).getDocument(as: DBUserModel.self)
    }
}
