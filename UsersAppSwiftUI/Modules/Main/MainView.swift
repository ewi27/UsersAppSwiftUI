//
//  RootView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 20/02/2024.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var mainViewModel = MainViewModel()
    
    var body: some View {
        switch mainViewModel.loginState {
        case .logged:
            NavigationStack {
                UsersView(logoutAction: {
                    mainViewModel.changeLoginState(state: .notLogged)
                })
            }
        case .notLogged:
            NavigationStack {
                GreetingAuthView {
                    mainViewModel.changeLoginState(state: .logged)
                }
            }
        case .none:
            ProgressView()
                .tint(Color("Color1"))
        }
    }
}

#Preview {
    NavigationStack {
        MainView()
    }
}
