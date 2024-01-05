//
//  UsersModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 17/12/2023.
//

typealias UsersModel = [UserModelElement]

struct UserModelElement: Codable {
    let id: Int
    let name, username, email, phone, website: String
    let address: AddressModel
    let company: CompanyModel
}

extension UserModelElement: Equatable {
    static func == (lhs: UserModelElement, rhs: UserModelElement) -> Bool {
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
