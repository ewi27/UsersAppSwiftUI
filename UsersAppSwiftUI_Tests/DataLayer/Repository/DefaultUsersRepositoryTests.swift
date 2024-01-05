//
//  DefaultUsersRepositoryTests.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 02/01/2024.
//

import XCTest
import Combine
@testable import UsersAppSwiftUI

final class DefaultUsersRepositoryTests: XCTestCase {
    
    var sut: DefaultUsersRepository!
    var dataService: UsersDataServiceSpy!
    
    var cancellables = Set<AnyCancellable>()
    
    enum TestError: Error {
        case myError
    }
    
    let testUsersModel: UsersModel = [UserModelElement(id: 1, name: "", username: "", email: "", phone: "", website: "", address: AddressModel(street: "", suite: "", city: "", zipcode: "", geo: GeoModel(lat: "", lng: "")), company: CompanyModel(name: "", catchPhrase: "", bs: ""))]
    
    let testUsers: Users = [User(id: 1, name: "", username: "", email: "", phone: "", website: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: Geo(lat: "", lng: "")), company: Company(name: "", catchPhrase: "", bs: ""))]
    
    override func setUpWithError() throws {
        dataService = .init()
        sut = DefaultUsersRepository(dataService: dataService)
    }
    
    override func tearDownWithError() throws {
        sut = nil
        
    }
    
    func test_fetchUsersInfo_whenIsSuccess_thenReturnUsers() {
        //given
        let expectation = XCTestExpectation()
        var resultUsers = Users()
        dataService.executedResult = Result<UsersModel, Error>.Publisher(testUsersModel).eraseToAnyPublisher()
        
        //when
        sut.fetchUsersInfo()
            .sink { compl in
                switch compl {
                case .finished:
                    break
                case .failure(_):
                    XCTFail()
                }
            } receiveValue: { returnedUsers in
                resultUsers = returnedUsers
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(dataService.executeCallsCount, 1)
        XCTAssertEqual(resultUsers, testUsers)
    }
    
    func test_fetchUsersInfo_whenIsFailure_thenReturnError() {
        //given
        let expectation = XCTestExpectation()
        var resultError: Error?
        dataService.executedResult = Result<UsersModel, Error>.failure(TestError.myError).publisher.eraseToAnyPublisher()
        
        //when
        sut.fetchUsersInfo()
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
        XCTAssertEqual(dataService.executeCallsCount, 1)
        XCTAssertEqual(resultError as! DefaultUsersRepositoryTests.TestError, TestError.myError)
    }
}
