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
        Spacer()
    }
}

#Preview {
    SettingsView()
}
