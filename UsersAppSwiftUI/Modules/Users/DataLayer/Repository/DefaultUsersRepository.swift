//
//  DefaultUsersRepository.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Combine

final class DefaultUsersRepository: UsersRepository {
    
    private let dataService: DataService
    
    init(dataService: DataService = UsersDataService()) {
        self.dataService = dataService
    }
    
    func fetchUsersInfo() -> AnyPublisher<Users, Error> {
        guard let url = UsersEndpoint.url else { return Empty<Users, Error>().eraseToAnyPublisher() }
        return dataService.request(url: url)
//            .map { usersModel in
//                usersModel.map { userModelElement in
//                    return User(userModel: userModelElement)
//                }
//            }
            .map { $0.map(User.init) }
            .eraseToAnyPublisher()
    }
}
