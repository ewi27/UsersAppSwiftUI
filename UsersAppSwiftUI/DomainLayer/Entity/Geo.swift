//
//  Geo.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 09/12/2023.
//

struct Geo {
    let lat, lng: String
}

extension Geo {
    init(geoModel: GeoModel) {
        self.init(lat: geoModel.lat, lng: geoModel.lng)
    }
}
