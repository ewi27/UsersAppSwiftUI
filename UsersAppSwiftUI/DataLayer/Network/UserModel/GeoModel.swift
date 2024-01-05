//
//  GeoModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 17/12/2023.
//

struct GeoModel: Codable {
    let lat, lng: String
}

extension GeoModel: Equatable {
    static func == (lhs: GeoModel, rhs: GeoModel) -> Bool {
        return lhs.lat == rhs.lat && lhs.lng == rhs.lng
    }
}
