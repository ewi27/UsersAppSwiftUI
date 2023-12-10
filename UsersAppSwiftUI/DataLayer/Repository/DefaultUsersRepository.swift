//
//  DefaultUsersRepository.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Combine

final class DefaultUsersRepository: UsersRepository {
    
    private let dataProvider: UsersDataProvider
    
    init(dataProvider: UsersDataProvider = DefaultUsersDataProvider()) {
        self.dataProvider = dataProvider
    }
    
    func fetchUsersInfo() -> AnyPublisher<Users, Error> {
        guard let url = Endpoint.url else { return Empty<Users, Error>().eraseToAnyPublisher() }
        return dataProvider.downloadData(url: url)
//            .map { usersModel in
//                usersModel.map { userModelElement in
//                    return User(userModel: userModelElement)
//                }
//            }
            .map { $0.map(User.init) }
            .eraseToAnyPublisher()
    }
}
