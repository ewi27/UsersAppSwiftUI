//
//  URLSessionMock.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 03/01/2024.
//

import Foundation
import Combine
@testable import UsersAppSwiftUI

final class URLSessionMock: URLSessionManagerProtocol {
    var mockData: Data?
    var mockError: URLError?
    
    func returnPublisher(for url: URL) -> AnyPublisher<(data: Data, response: URLResponse), URLError> {
        if let error = mockError {
            return Fail(error: error).eraseToAnyPublisher()
            
        } else if let data = mockData {
            let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return Just((data: data, response: response))
                .setFailureType(to: URLError.self)
                .eraseToAnyPublisher()
        } else {
            fatalError("Provide either a mockData or a mockError for URLSessionMock")
        }
    }
}
