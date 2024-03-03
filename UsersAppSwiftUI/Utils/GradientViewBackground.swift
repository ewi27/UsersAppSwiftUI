//
//  GradientViewBackground.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 07/12/2023.
//

import SwiftUI

struct GradientViewBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color("Color1"), Color("Color2")]),
                    startPoint: .leading,
                    endPoint: .trailing)
            )
    }
}
