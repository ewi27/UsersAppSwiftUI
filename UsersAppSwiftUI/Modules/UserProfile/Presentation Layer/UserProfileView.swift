//
//  UserProfileView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 13/03/2024.
//

import SwiftUI

struct UserProfileView: View {
    
    @StateObject private var viewModel = UserProfileViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            switch viewModel.state {
            case .userProfile(let profile):
                Text("User email is: \(profile.email ?? "no email")")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.init(uiColor: .lightGray))
                    .cornerRadius(10)
                    .shadow(radius: 15)
                Text("User profile created date: \(profile.dateCreated?.description ?? "no date created")")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.init(uiColor: .lightGray))
                    .cornerRadius(10)
                    .shadow(radius: 15)
            case .noUserProfile:
                Text("No user profile")
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.init(uiColor: .lightGray))
                    .cornerRadius(10)
                    .shadow(radius: 15)
            case .none:
                ProgressView()
                    .tint(Color("Color1"))
            }
        }
        .task {
            try? await viewModel.loadCurrentUser()
        }
        Spacer()
    }
}

#Preview {
    UserProfileView()
}
