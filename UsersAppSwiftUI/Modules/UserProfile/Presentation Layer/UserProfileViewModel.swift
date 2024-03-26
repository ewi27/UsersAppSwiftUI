//
//  UserProfileViewModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 13/03/2024.
//

import Foundation

@MainActor
final class UserProfileViewModel: ObservableObject {
    
    enum UserProfileState {
        case userProfile(UserProfile)
        case noUserProfile
    }
    
    @Published var user: UserProfile?
    private let userProfileUseCase: UserProfileUseCase
    private let authUseCase: AuthenticationUseCase
    var state: UserProfileState?
    
    init(userProfileUseCase: UserProfileUseCase = DefaultUserProfileUseCase(),
         authUseCase: AuthenticationUseCase = DefaultAuthenticationUseCase()) {
        self.userProfileUseCase = userProfileUseCase
        self.authUseCase = authUseCase
    }
    
    func loadCurrentUser() async throws {
        let result = try authUseCase.authenticatedUser()
        user = try await userProfileUseCase.getUserProfile(userId: result.id)
        if let userProf = user {
            state = .userProfile(userProf)
        } else {
            state = .noUserProfile
        }
    }
}
