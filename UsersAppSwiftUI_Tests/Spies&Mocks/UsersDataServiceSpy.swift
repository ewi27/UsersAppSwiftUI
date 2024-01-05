//
//  UsersDataServiceSpy.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 02/01/2024.
//

import Foundation
import Combine
@testable import UsersAppSwiftUI

final class UsersDataServiceSpy: DataService {
    
    var executeCallsCount = 0
    var executedResult: AnyPublisher<UsersModel, Error>?
    
    func request(url: URL) -> AnyPublisher<UsersModel, Error> {
        executeCallsCount += 1
        return executedResult ?? Empty<UsersModel, Error>().eraseToAnyPublisher()
    }
}
