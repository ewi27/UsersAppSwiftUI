//
//  Extensions.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 07/12/2023.
//

import SwiftUI

extension Binding where Value == Bool {
    init<T>(value: Binding<T?>) {
        self.init {
            value.wrappedValue != nil
        } set: { newValue in
            if !newValue {
                value.wrappedValue = nil
            }
        }
    }
}
