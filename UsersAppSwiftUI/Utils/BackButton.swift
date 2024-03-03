//
//  BackButton.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 30/11/2023.
//

import SwiftUI

func makeBackButton(dismiss: DismissAction) -> some View {
    return Button {
        dismiss()
    } label: {
        Image(systemName: "xmark")
            .font(.title)
            .foregroundStyle(.gray)
    }
    .padding()
    .modifier(GradientViewBackground())
    .cornerRadius(10)
    .padding()
}
