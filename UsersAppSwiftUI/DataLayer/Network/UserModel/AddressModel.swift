//
//  AddressModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 17/12/2023.
//

struct AddressModel: Codable {
    let street, suite, city, zipcode: String
    let geo: GeoModel
}

extension AddressModel: Equatable {
    static func == (lhs: AddressModel, rhs: AddressModel) -> Bool {
        return lhs.street == rhs.street &&
        lhs.suite == rhs.suite &&
        lhs.city == rhs.city &&
        lhs.zipcode == rhs.zipcode &&
        lhs.geo == rhs.geo
    }
}
