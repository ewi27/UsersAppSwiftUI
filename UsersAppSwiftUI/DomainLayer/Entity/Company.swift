//
//  Company.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 09/12/2023.
//

struct Company {
    let name, catchPhrase, bs: String
}

extension Company {
    init(comapanyModel: CompanyModel) {
        self.init(name: comapanyModel.name, catchPhrase: comapanyModel.catchPhrase, bs: comapanyModel.bs)
    }
}
