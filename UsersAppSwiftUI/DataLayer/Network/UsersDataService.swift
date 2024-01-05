//
//  UsersDataService.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 31/12/2023.
//

import Foundation
import Combine

protocol DataService {
    func request(url: URL) -> AnyPublisher<UsersModel, Error>
}

final class UsersDataService: DataService {
    
    private let dataProvider: DataProvider
    
    init(dataProvider: DataProvider = DefaultDataProvider()) {
        self.dataProvider = dataProvider
    }
    
    func request(url: URL) -> AnyPublisher<UsersModel, Error> {
        dataProvider.downloadData(url: url)
            .decode(type: UsersModel.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
