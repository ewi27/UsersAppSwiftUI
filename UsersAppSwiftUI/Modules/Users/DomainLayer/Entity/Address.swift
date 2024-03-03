//
//  Address.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 09/12/2023.
//

struct Address {
    let street, suite, city, zipcode: String
    let geo: Geo?
}

extension Address {
    init(addressModel: AddressModel) {
        self.init(street: addressModel.street, suite: addressModel.suite, city: addressModel.city, zipcode: addressModel.zipcode, geo: Geo(geoModel: addressModel.geo))
    }
}

extension Address: Equatable {
    static func == (lhs: Address, rhs: Address) -> Bool {
        return lhs.street == rhs.street &&
        lhs.suite == rhs.suite &&
        lhs.city == rhs.city &&
        lhs.zipcode == rhs.zipcode &&
        lhs.geo == rhs.geo
    }
}
