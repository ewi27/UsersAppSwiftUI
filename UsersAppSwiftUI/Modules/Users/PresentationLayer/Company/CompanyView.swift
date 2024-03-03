//
//  CompanyView.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 26/11/2023.
//

import SwiftUI

struct CompanyView: View {
    
    @Environment(\.dismiss) var dismiss
    private let company: Company
    
    init(company: Company) {
        self.company = company
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text("Name: \(company.name)")
            Text("Catch phrase: \(company.catchPhrase)")
            Text("Bs: \(company.bs)")
        }
        .font(.title)
        .fontWeight(.bold)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(.ultraThinMaterial)
        .overlay(alignment: .topLeading) {
            makeBackButton(dismiss: dismiss)
        }
    }
}

#Preview {
    CompanyView(company: Company(name: "name", catchPhrase: "catchPhrase", bs: "bs"))
}
