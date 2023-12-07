//
//  DataService.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Foundation
import Combine

protocol UsersDataProvider {
    func downloadData(url: URL) -> AnyPublisher<UsersModel, Error>
}

final class DefaultUsersDataProvider: UsersDataProvider {
    
    func downloadData(url: URL) -> AnyPublisher<UsersModel, Error> {
        URLSession.shared
            .dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: UsersModel.self, decoder: JSONDecoder())
            .mapError { $0 as Error }
            .eraseToAnyPublisher()
    }
}
