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
