//
//  FetchUsersUseCase.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Combine

protocol FetchUsersUseCase {
    func execute() -> AnyPublisher<Users, Error>
}

final class DefaultFetchUsersUseCase: FetchUsersUseCase {
    
    private let usersRepository: UsersRepository
    
    init(usersRepository: UsersRepository = DefaultUsersRepository()) {
        self.usersRepository = usersRepository
    }
    
    func execute() -> AnyPublisher<Users, Error> {
        return usersRepository.fetchUsersInfo()
    }
}
