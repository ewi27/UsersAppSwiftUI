//
//  FetchUsersUseCaseSpy.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 01/01/2024.
//

import Combine
@testable import UsersAppSwiftUI

final class FetchUsersUseCaseSpy: FetchUsersUseCase {
    
    var executeCallsCount = 0
    var expectedResult: AnyPublisher<Users, Error>?
    
    func execute() -> AnyPublisher<Users, Error> {
        self.executeCallsCount += 1
        return expectedResult ?? Empty<Users, Error>().eraseToAnyPublisher()
    }
}
