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
