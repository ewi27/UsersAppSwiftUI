//
//  DefaultDataProviderSpy.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 03/01/2024.
//

import Foundation
import Combine
@testable import UsersAppSwiftUI

final class DefaultDataProviderSpy: DataProvider {
    
    var executeCallsCount = 0
    var executedResult: AnyPublisher<Data, Error>?
    
    func downloadData(url: URL) -> AnyPublisher<Data, Error> {
        executeCallsCount += 1
        return executedResult ?? Empty<Data, Error>().eraseToAnyPublisher()
    }
}
