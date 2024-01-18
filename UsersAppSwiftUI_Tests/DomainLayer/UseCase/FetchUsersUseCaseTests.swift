//
//  FetchUsersUseCaseTests.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 02/01/2024.
//

import XCTest
import Combine
@testable import UsersAppSwiftUI

final class FetchUsersUseCaseTests: XCTestCase {
    
    var sut: DefaultFetchUsersUseCase!
    var repository: DefaultUsersRepositorySpy!
    
    var cancellables = Set<AnyCancellable>()
    
    enum TestError: Error {
        case myError
    }
    
    let testUsers: Users = [User(id: 1, name: "", username: "", email: "", phone: "", website: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: nil), company: Company(name: "", catchPhrase: "", bs: ""))]
    
    override func setUpWithError() throws {
        repository = .init()
        sut = DefaultFetchUsersUseCase(usersRepository: repository)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_execute_whenIsSuccess_thenReturnUsers() {
        //given
        let expectation = XCTestExpectation()
        var resultUsers = Users()
        repository.expectedResult = Result<Users, Error>.Publisher(testUsers).eraseToAnyPublisher()
        
        //when
        sut.execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    XCTFail()
                }
            }, receiveValue: { users in
                resultUsers = users
                expectation.fulfill()
            })
            .store(in: &cancellables)
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(repository.executeCallsCount, 1)
        XCTAssertEqual(resultUsers, testUsers)
    }
    
    func test_execute_whenIsFailure_thenReturnError() {
        //given
        let expectation = XCTestExpectation()
        var resultError: Error?
        repository.expectedResult = Result<Users, Error>.failure(TestError.myError).publisher.eraseToAnyPublisher()
        
        //when
        sut.execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    XCTFail("It shouldn't be a success.")
                case .failure(let error):
                    resultError = error
                    expectation.fulfill()
                }
            }, receiveValue: { _ in
            })
            .store(in: &cancellables)
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(repository.executeCallsCount, 1)
        XCTAssertEqual(resultError as! FetchUsersUseCaseTests.TestError, TestError.myError)
    }
}
