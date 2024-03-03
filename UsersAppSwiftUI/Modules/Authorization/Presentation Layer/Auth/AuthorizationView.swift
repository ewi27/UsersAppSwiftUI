//
//  AuthorizationView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 22/02/2024.
//

import SwiftUI

struct AuthorizationView: View {
    
    @ObservedObject private var viewModel: AuthorizationViewModel
    var setLoggedState: (() -> Void)?
    
    init(state: AuthorizationViewModel.State, setLoggedState: (() -> Void)?) {
        self.viewModel = .init(state: state)
        self.setLoggedState = setLoggedState
    }
    
    var body: some View {
        switch viewModel.state {
        case .registerScreen:
            SignUpView(setLoginScreen: {
                viewModel.state = .loginScreen
            }, setLoggedState: {
                setLoggedState?()
            })
        case .loginScreen:
            SignInView(setRegisterScreen: {
                viewModel.state = .registerScreen
            }, setLoggedState: {
                setLoggedState?()
            })
        }
    }
}

#Preview {
    NavigationStack {
        AuthorizationView(state: .registerScreen, setLoggedState: {})
    }
}
