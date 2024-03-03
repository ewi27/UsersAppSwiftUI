//
//  AuthenticationView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 22/02/2024.
//

import SwiftUI

struct AuthenticationView: View {
    
    @ObservedObject private var viewModel: AuthenticationViewModel
    var setLoggedState: (() -> Void)?
    
    init(state: AuthenticationViewModel.State, setLoggedState: (() -> Void)?) {
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
        AuthenticationView(state: .registerScreen, setLoggedState: {})
    }
}
