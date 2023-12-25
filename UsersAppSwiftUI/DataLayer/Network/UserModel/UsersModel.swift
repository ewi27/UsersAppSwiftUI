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
