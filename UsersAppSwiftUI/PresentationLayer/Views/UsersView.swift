//
//  UsersView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject private var vm = UsersViewModel()
    
    var body: some View {
        switch vm.state {
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
            .navigationBarTitle("Users")
        }
    }
    
    private var errorView: some View {
        Text("")
            .alert("Oh no, error is here! 😮", isPresented: Binding(value: $vm.errorMessage), actions: {
                Button(role: .cancel, action: {}) {
                    Text("Cancel")
                }
                Button {
                    vm.fetchUsers()
                } label: {
                    Text("Try again")
                }
            }, message: {
                Text(vm.errorMessage ?? "This is error.")
            })
    }
    
    private var fetchUsersButtonView: some View {
        Button(action: {
            vm.fetchUsers()
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
