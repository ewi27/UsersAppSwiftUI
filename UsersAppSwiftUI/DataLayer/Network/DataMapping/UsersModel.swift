//
//  UsersModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Foundation

typealias UsersModel = [UsersModelElement]

// MARK: - UsersModelElement
struct UsersModelElement: Codable {
    let id: Int
    let name, username, email: String
    let address: AddressModel
    let phone, website: String
    let company: CompanyModel
}

// MARK: - AddressModel
struct AddressModel: Codable {
    let street, suite, city, zipcode: String
    let geo: GeoElement
}

// MARK: - GeoElement
struct GeoElement: Codable {
    let lat, lng: String
}

// MARK: - CompanyModel
struct CompanyModel: Codable {
    let name, catchPhrase, bs: String
}

extension UsersModel {
    func mapToDomain() -> Users {
        let model = self.map { element in
            return User.init(id: element.id, name: element.name, username: element.username, email: element.email, address: element.address.mapToAddress(), phone: element.phone, website: element.website, company: element.company.mapToCompany())
        }
        return model
    }
}

extension AddressModel {
    func mapToAddress() -> Address {
        return Address.init(street: street, suite: suite, city: city, zipcode: zipcode, geo: geo.mapToGeo())
    }
}

extension GeoElement {
    func mapToGeo() -> Geo {
        return Geo(lat: lat, lng: lng)
    }
}

extension CompanyModel {
    func mapToCompany() -> Company {
        return Company.init(name: name, catchPhrase: catchPhrase, bs: bs)
    }
}
