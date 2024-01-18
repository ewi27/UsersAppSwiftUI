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
    var errorMessage: String? = nil
    
    init(useCase: FetchUsersUseCase = DefaultFetchUsersUseCase()) {
        self.useCase = useCase
    }
    
    func fetchUsers() {
        state = .isLoading
        useCase.execute()
            .receive(on: DispatchQueue.main)
            .map { ViewState.isReady($0) }
            .catch { error -> AnyPublisher<ViewState?, Never> in
                self.errorMessage = error.localizedDescription
                return Just(.error).eraseToAnyPublisher()
            }
            .replaceError(with: .error)
            .assign(to: &$state)
    }
}
