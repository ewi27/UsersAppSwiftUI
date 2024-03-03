//
//  UsersDataProvider.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Foundation
import Combine

protocol DataProvider {
    func downloadData(url: URL) -> AnyPublisher<Data, Error>
}

final class DefaultDataProvider: DataProvider {
    
    let urlSession: URLSessionManagerProtocol
    
    init(urlSession: URLSessionManagerProtocol = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func downloadData(url: URL) -> AnyPublisher<Data, Error> {
        urlSession
            .returnPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .tryMap { (data, response) -> Data in
                guard let response = response as? HTTPURLResponse,
                      response.statusCode >= 200 && response.statusCode < 300 else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .eraseToAnyPublisher()
    }
}
