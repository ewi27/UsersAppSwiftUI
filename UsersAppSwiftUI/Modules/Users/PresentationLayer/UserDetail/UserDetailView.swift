//
//  UsersModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 26/11/2023.
//

import SwiftUI

struct UserDetailView: View {
    
    @State private var showAddressView = false
    @State private var showCompanyView = false
    private let model: User
    
    init(model: User) {
        self.model = model
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30.0) {
                makeDetailsText(title: "Name:", value: model.name)
                makeDetailsText(title: "Username:", value: model.username)
                makeDetailsText(title: "Email:", value: model.email)
                makeDetailsText(title: "Address:", value: "CLICK ME")
                    .onTapGesture {
                        showAddressView.toggle()
                    }
                    .sheet(isPresented: $showAddressView, content: {
                        AddressView(address: model.address)
                    })
                makeDetailsText(title: "Phone:", value: model.phone)
                makeDetailsText(title: "Website:", value: model.website)
                makeDetailsText(title: "Company:", value: "CLICK ME")
                    .onTapGesture {
                        showCompanyView.toggle()
                    }
                    .sheet(isPresented: $showCompanyView, content: {
                        CompanyView(company: model.company)
                    })
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
    }
}

#Preview {
    UserDetailView(model: User(id: 1, name: "Ross", username: "t-rex", email: "email@.com", phone: "12345678910117", website: "dino.com", address: Address(street: "street", suite: "suite", city: "nyc", zipcode: "zipcode", geo: nil), company: Company(name: "Big Dino", catchPhrase: "something", bs: "something")))
}

extension UserDetailView {
    func makeDetailsText(title: String, value: String) -> some View {
        Text(title + " " + value)
            .font(.headline)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(30)
            .modifier(GradientViewBackground())
            .cornerRadius(10)
    }
}
