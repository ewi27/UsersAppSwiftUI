//
//  UsersViewModelTests.swift
//  UsersAppSwiftUITests
//
//  Created by Ewelina on 31/12/2023.
//

import XCTest
import Combine
@testable import UsersAppSwiftUI

final class UsersViewModelTests: XCTestCase {
    
    var sut: UsersViewModel!
    var fetchUsersUseCase: FetchUsersUseCaseSpy!
    
    var cancellables = Set<AnyCancellable>()
    
    enum TestError: Error {
        case myError
    }
    
    let testUsers: Users = [User(id: 1, name: "", username: "", email: "", phone: "", website: "", address: Address(street: "", suite: "", city: "", zipcode: "", geo: nil), company: Company(name: "", catchPhrase: "", bs: ""))]
    
    override func setUpWithError() throws {
        fetchUsersUseCase = .init()
        sut = UsersViewModel(useCase: fetchUsersUseCase)
    }
    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    func test_fetchUsers_fromFetchUsersUseCase_whenIsSuccess_setIsReadyState() {
        //given
        let expectation = XCTestExpectation()
        let expectedState: ViewState = .isReady(testUsers)
        var returnedState: ViewState?
        fetchUsersUseCase.expectedResult = Result<Users, Error>.Publisher(testUsers).eraseToAnyPublisher()
        
        //when
        sut.$state
            .sink(receiveValue: { newState in
                returnedState = newState
                if newState == expectedState {
                    expectation.fulfill()
                }
            })
            .store(in: &cancellables)
        sut.fetchUsers()
        
        //then
        XCTAssertEqual(returnedState, ViewState.isLoading)
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(fetchUsersUseCase.executeCallsCount, 1)
        XCTAssertEqual(returnedState, expectedState)
    }
    
    func test_fetchUsers_fromFetchUsersUseCase_whenIsError_setErrorState() {
        //given
        let expectation = XCTestExpectation()
        let expectedState: ViewState = .error
        var returnedState: ViewState?
        fetchUsersUseCase.expectedResult = Result<Users, Error>.failure(TestError.myError).publisher.eraseToAnyPublisher()
        
        //when
        sut.$state
            .sink(receiveValue: { newState in
                returnedState = newState
                if newState == expectedState {
                    expectation.fulfill()
                }
            })
            .store(in: &cancellables)
        sut.fetchUsers()
        
        //then
        XCTAssertEqual(returnedState, ViewState.isLoading)
        wait(for: [expectation], timeout: 5)
        XCTAssertEqual(fetchUsersUseCase.executeCallsCount, 1)
        XCTAssertEqual(returnedState, expectedState)
    }
}
