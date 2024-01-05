//
//  URLSessionManager.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 03/01/2024.
//

import Foundation
import Combine

protocol URLSessionManagerProtocol {
    func returnPublisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
}

// ????
//extension URLSession: URLSessionManagerProtocol {}

//protocol DataTaskPublisherProtocol {
//   func returnPublisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError>
//}

extension URLSession: URLSessionManagerProtocol  {
    func returnPublisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        return dataTaskPublisher(for: url)
            .eraseToAnyPublisher()
    }
}
