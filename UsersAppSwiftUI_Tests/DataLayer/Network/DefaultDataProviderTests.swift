//
//  DefaultDataProviderTests.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 03/01/2024.
//

import XCTest
import Foundation
import Combine
@testable import UsersAppSwiftUI

final class DefaultDataProviderTests: XCTestCase {
    
    var sut: DefaultDataProvider!
    var urlSession: URLSessionMock!
    
    var cancellables = Set<AnyCancellable>()
    
    let testURL = URL(string: "testUrl")!
    
    override func setUpWithError() throws {
        urlSession = .init()
        sut = DefaultDataProvider(urlSession: urlSession)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_downloadData_whenIsSuccess_thenReturnData() {
        //given
        let expectation = XCTestExpectation()
        let expectedData = "Test data".data(using: .utf8)!
        urlSession.mockData = expectedData
        var resultData = Data()
        
        //when
        sut.downloadData(url: testURL)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    XCTFail()
                }
            } receiveValue: { returnedData in
                resultData = returnedData
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(resultData, expectedData)
    }
    
    func test_downloadData_whenIsFailure_thenReturnError() {
        //given
        let expectation = XCTestExpectation()
        var expectedURLError = URLError(.badURL)
        urlSession.mockError = expectedURLError
        var resultError: Error?
        
        //when
        sut.downloadData(url: testURL)
            .sink { completion in
                switch completion {
                case .finished:
                    XCTFail("It shouldn't be a success.")
                case .failure(let error):
                    resultError = error
                    expectation.fulfill()
                }
            } receiveValue: { _ in
            }
            .store(in: &cancellables)
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertNotNil(resultError)
        XCTAssertEqual(resultError as! URLError, expectedURLError)
    }
}
