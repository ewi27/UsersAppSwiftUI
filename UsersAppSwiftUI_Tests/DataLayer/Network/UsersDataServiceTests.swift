//
//  UsersDataServiceTests.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 03/01/2024.
//

import XCTest
import Foundation
import Combine
@testable import UsersAppSwiftUI

final class UsersDataServiceTests: XCTestCase {
    
    var sut: UsersDataService!
    var dataProvider: DefaultDataProviderSpy!
    
    let testURL = URL(string: "testUrl")
    
    var cancellables = Set<AnyCancellable>()
    
    enum TestError: Error {
        case myError
    }
    
    let testUsersModel: UsersModel = [UserModelElement(id: 1, name: "", username: "", email: "", phone: "", website: "", address: AddressModel(street: "", suite: "", city: "", zipcode: "", geo: GeoModel(lat: "", lng: "")), company: CompanyModel(name: "", catchPhrase: "", bs: ""))]
    
    let dataTest = #"[{ "id": 1, "name": "", "username": "", "email": "", "phone": "", "website": "", "address": { "street": "", "suite": "", "city": "", "zipcode": "", "geo": { "lat": "", "lng": "" } }, "company": { "name": "", "catchPhrase": "", "bs": "" } }]"#.data(using: .utf8)
    
    override func setUpWithError() throws {
        dataProvider = .init()
        sut = UsersDataService(dataProvider: dataProvider)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_requestWithUrl_whenIsSuccess_thenReturnUsersModel() {
        //given
        let expectation = XCTestExpectation()
        var resultUsersModel = UsersModel()
        dataProvider.executedResult = Result<Data, Error>.Publisher(dataTest!).eraseToAnyPublisher()
        
        //when
        sut.request(url: testURL!)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(_):
                    XCTFail()
                }
            } receiveValue: { returnedUsersModel in
                resultUsersModel = returnedUsersModel
                expectation.fulfill()
            }
            .store(in: &cancellables)
        
        //then
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(dataProvider.executeCallsCount, 1)
        XCTAssertEqual(resultUsersModel, testUsersModel)
    }
    
    func test_requestWithUrl_whenIsFailure_thenReturnError() {
        //given
        let expectation = XCTestExpectation()
        var resultError: Error?
        dataProvider.executedResult = Result<Data, Error>.failure(TestError.myError).publisher.eraseToAnyPublisher()
        
        //when
        sut.request(url: testURL!)
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
        XCTAssertEqual(dataProvider.executeCallsCount, 1)
        XCTAssertEqual(resultError as! UsersDataServiceTests.TestError, TestError.myError)
    }
}
