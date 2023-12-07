//
//  AddressView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 26/11/2023.
//

import SwiftUI

struct AddressView: View {
    
    @Environment(\.dismiss) var dismiss
    
    let address: Address
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20.0) {
            Text("Street: \(address.street)")
            Text("Suite: \(address.suite)")
            Text("City: \(address.city)")
            Text("Zipcode: \(address.zipcode)")
        }
        .font(.title)
        .fontWeight(.bold)
        .lineLimit(3)
        .minimumScaleFactor(0.5)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            makeBackButton(dismiss: dismiss)
        }
    }
}

#Preview {
    AddressView(address: Address(street: "street", suite: "suite", city: "city", zipcode: "zipcode", geo: nil))
}
