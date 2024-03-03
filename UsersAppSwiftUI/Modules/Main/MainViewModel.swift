//
//  RootViewModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    enum LoginState {
        case logged
        case notLogged
    }
    
    @Published var loginState: LoginState?
    private let useCase: AuthenticationUseCase
    
    init(useCase: AuthenticationUseCase = DefaultAuthenticationUseCase()) {
        self.useCase = useCase
        setLoginState()
    }
    
    func setLoginState() {
        let user = try? useCase.authenticatedUser()
        loginState = user == nil ? .notLogged : .logged
    }
    
    func changeLoginState(state: LoginState) {
        loginState = state
    }
}
