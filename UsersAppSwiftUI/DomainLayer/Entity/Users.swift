//
//  Users.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

typealias Users = [User]

struct User {
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
}

struct Address {
    let street, suite, city, zipcode: String
    let geo: Geo?
}

struct Geo {
    let lat, lng: String
}

struct Company {
    let name, catchPhrase, bs: String
}

