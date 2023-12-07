//
//  UsersViewModel.swift
//  UsersAppSwiftUI
//
//  Created by Ewelina on 25/11/2023.
//

import Foundation
import Combine

enum ViewState {
    case isReady
    case error
    case isLoading
}

final class UsersViewModel: ObservableObject {
    
    @Published var users: Users = []
    @Published var state: ViewState?
    
    let useCase = DefaultFetchUsersUseCase()
    var errorMessage: String? = nil
    var cancellables = Set<AnyCancellable>()
    
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
                    self?.state = .isReady
                    self?.users = users
            }
            .store(in: &cancellables)
    }
}
