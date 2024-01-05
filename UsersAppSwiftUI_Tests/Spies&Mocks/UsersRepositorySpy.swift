//
//  UsersRepositorySpy.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 02/01/2024.
//

import Combine
@testable import UsersAppSwiftUI

final class DefaultUsersRepositorySpy: UsersRepository {
    
    var executeCallsCount = 0
    var expectedResult: AnyPublisher<Users, Error>?
    
    func fetchUsersInfo() -> AnyPublisher<Users, Error> {
        self.executeCallsCount += 1
        return expectedResult ?? Empty<Users, Error>().eraseToAnyPublisher()
    }
}
