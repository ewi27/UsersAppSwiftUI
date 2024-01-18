//
//  CompanyModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 17/12/2023.
//

struct CompanyModel: Codable {
    let name, catchPhrase, bs: String
}

extension CompanyModel: Equatable {
    static func == (lhs: CompanyModel, rhs: CompanyModel) -> Bool {
        return lhs.name == rhs.name &&
        lhs.catchPhrase == rhs.catchPhrase &&
        lhs.bs == rhs.bs
    }
}
