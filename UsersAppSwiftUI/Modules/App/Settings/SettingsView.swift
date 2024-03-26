//
//  SettingsView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import SwiftUI

struct SettingsView: View {
    
    @StateObject private var viewModel = SettingsViewModel()
    var logoutAction: (() -> Void)?
    
    var body: some View {
        VStack(spacing: 40) {
            Button(action: {
                Task {
                    do {
                        try viewModel.signOut()
                        logoutAction?()
                    } catch {
                        print("error signup \(error)")
                    }
                }
            }, label: {
                Text("SIGN OUT")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                    .modifier(GradientViewBackground())
                    .cornerRadius(10)
                    .shadow(radius: 15)
                    .foregroundStyle(.gray)
                    .minimumScaleFactor(0.3)
                    .lineLimit(1)
            })
            NavigationLink {
                UserProfileView()
            } label: {
                Text("See user profile info")
                    .font(.title)
                    .fontWeight(.semibold)
                    .padding()
                    .modifier(GradientViewBackground())
                    .cornerRadius(10)
                    .shadow(radius: 15)
                    .foregroundStyle(.gray)
                    .minimumScaleFactor(0.3)
                    .lineLimit(1)
            }
        }
        Spacer()
    }
}

#Preview {
    NavigationStack {
        SettingsView()
    }
}
