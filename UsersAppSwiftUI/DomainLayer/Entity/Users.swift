//
//  Users.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

typealias Users = [User]

struct User {
    
    let id: Int
    let name, username, email, phone, website: String
    let address: Address
    let company: Company
}

extension User {
    init(userModel: UserModelElement) {
        self.init(id: userModel.id, name: userModel.name, username: userModel.username, email: userModel.email, phone: userModel.phone, website: userModel.website, address: Address(addressModel: userModel.address), company: Company(comapanyModel: userModel.company))
    }
}

extension User: Equatable {
    static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id &&
        lhs.name == rhs.name &&
        lhs.username == rhs.username &&
        lhs.email == rhs.email &&
        lhs.phone == rhs.phone &&
        lhs.website == rhs.website &&
        lhs.address == rhs.address &&
        lhs.company == rhs.company
    }
}
