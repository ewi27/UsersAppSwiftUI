//
//  DefaultUsersRepository.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Foundation
import Combine

class DefaultUsersRepository: UsersRepository {
    
    let dataService: UsersDataProvider
    
    init(dataService: UsersDataProvider = DefaultUsersDataProvider()) {
        self.dataService = dataService
    }
    
    func fetchUsersInfo() -> AnyPublisher<Users, Error> {
        guard let url = Endpoint.url else { return Empty<Users, Error>().eraseToAnyPublisher() }
        return dataService.downloadData(url: url)
            .map { usersModel in
                return usersModel.mapToDomain()
            }
            .eraseToAnyPublisher()
    }
}
