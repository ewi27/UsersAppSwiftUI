//
//  UsersView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject private var viewModel = UsersViewModel()
    var logoutAction: (() -> Void)?
    
    var body: some View {
        switch viewModel.state {
        case .isReady(let users):
            makeListView(users: users)
        case .error:
            errorView
        case .isLoading:
            ProgressView()
                .tint(Color("Color1"))
        case .none:
            fetchUsersButtonView
        }
    }
}

#Preview {
    UsersView()
}

extension UsersView {
    func makeListView(users: Users) -> some View {
        VStack {
            settingsView
            NavigationStack {
                List {
                    ForEach(users, id: \.id) { user in
                        NavigationLink {
                            UserDetailView(model: user)
                        } label: {
                            HStack {
                                Image(systemName: "person.fill")
                                Text("\(user.name)")
                            }
                        }
                        .padding(30)
                        .modifier(GradientViewBackground())
                    }
                }
                .padding(5)
                .listStyle(.plain)
                .navigationTitle("Users")
            }
        }
    }
    
    private var errorView: some View {
        fetchUsersButtonView
            .alert("Oh no, error is here! 😮", isPresented: Binding(value: $viewModel.errorMessage), actions: {
                Button(role: .cancel, action: {}) {
                    Text("Cancel")
                }
                Button {
                    viewModel.fetchUsers()
                } label: {
                    Text("Try again")
                }
            }, message: {
                Text(viewModel.errorMessage ?? "This is error.")
            })
    }
    
    private var fetchUsersButtonView: some View {
        VStack {
            Button(action: {
                viewModel.fetchUsers()
            }, label: {
                Text("Click to download users")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundStyle(.gray)
                    .padding()
                    .minimumScaleFactor(0.3)
                    .lineLimit(1)
            })
            .frame(maxWidth: .infinity)
            .modifier(GradientViewBackground())
            .cornerRadius(10)
            .padding(.all)
            .shadow(radius: 15)
        }
    }
    
    private var settingsView: some View {
        NavigationLink {
            SettingsView(logoutAction: logoutAction)
        } label: {
            Text("Settings")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.gray)
                .padding()
                .minimumScaleFactor(0.3)
                .lineLimit(1)
        }
        .frame(maxWidth: .infinity)
        .modifier(GradientViewBackground())
        .cornerRadius(10)
        .padding(.all)
        .shadow(radius: 15)
    }
}
