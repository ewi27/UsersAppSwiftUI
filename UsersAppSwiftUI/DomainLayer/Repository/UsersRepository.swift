//
//  UsersRepository.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Combine

protocol UsersRepository {
    func fetchUsersInfo() -> AnyPublisher<Users, Error>
}
