//
//  AuthenticationViewModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 22/02/2024.
//

import Foundation

final class AuthenticationViewModel: ObservableObject {
    
    enum State {
        case loginScreen
        case registerScreen
    }
    
    @Published var state: State
    
    init(state: State) {
        self.state = state
    }
}
