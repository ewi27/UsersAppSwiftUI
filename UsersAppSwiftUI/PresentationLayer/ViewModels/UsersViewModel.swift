//
//  UsersViewModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Foundation
import Combine

enum ViewState {
    case isReady(Users)
    case error
    case isLoading
}

extension ViewState: Equatable {
    static func == (lhs: ViewState, rhs: ViewState) -> Bool {
        switch (lhs, rhs) {
        case (.isReady(_), .isReady(_)):
            return true
        case (.error, .error):
            return true
        case (.isLoading, .isLoading):
            return true
        default:
            return false
        }
    }
}

final class UsersViewModel: ObservableObject {
    
    @Published private(set) var state: ViewState?
    private let useCase: FetchUsersUseCase
    private var cancellables = Set<AnyCancellable>()
    var errorMessage: String? = nil
    
    init(useCase: FetchUsersUseCase = DefaultFetchUsersUseCase()) {
        self.useCase = useCase
    }
    
    func fetchUsers() {
        state = .isLoading
        useCase.execute()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                    self?.state = .error
                }
            } receiveValue: { [weak self] users in
                self?.state = .isReady(users)
            }
            .store(in: &cancellables)
    }
}
