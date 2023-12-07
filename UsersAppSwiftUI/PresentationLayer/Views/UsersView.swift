//
//  UsersView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject private var vm = UsersViewModel()
    @State var showAlert: Bool = false
    
    var body: some View {
        switch vm.state {
        case .isReady:
            listView
        case .error:
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
        case .isLoading:
            ProgressView()
                .tint(Color("Color1"))
        case .none:
            buttonView
        }
    }
}

#Preview {
    UsersView()
}

extension UsersView {
    private var listView: some View {
        NavigationStack {
            List {
                ForEach(vm.users, id: \.id) { item in
                    NavigationLink {
                        UserDetailView(model: item)
                    } label: {
                        HStack {
                            Image(systemName: "person.fill")
                            Text("\(item.name)")
                        }
                    }
                    .padding(30)
                    .modifier(GradientViewBackground())
                }
            }
            .listStyle(.plain)
            .navigationBarTitle("Users")
        }
    }
    
    private var buttonView: some View {
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
