//
//  UsersModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

typealias UsersModel = [UserModelElement]

struct UserModelElement: Codable {
    let id: Int
    let name, username, email: String
    let address: AddressModel
    let phone, website: String
    let company: CompanyModel
}

struct AddressModel: Codable {
    let street, suite, city, zipcode: String
    let geo: GeoModel
}

struct GeoModel: Codable {
    let lat, lng: String
}

struct CompanyModel: Codable {
    let name, catchPhrase, bs: String
}
