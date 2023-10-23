//
//  HomeViewModel.swift
//  RickAndMorty
//
//  Created by rafael douglas on 21/10/23.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    enum State: Equatable {
        case initial
        case loading
    }
    
    // MARK: Publishers
    @Published var firstCharacters: [RMCharacter] = []
    @Published var characters: [RMCharacter] = []
    @Published var state: State = .initial
    @Published var showAlert = false
    
    // MARK: Private Properties
    private let service: ServiceProtocol
    
    // MARK: Initializers
    init(service: ServiceProtocol) {
        self.service = service
    }
    
    // MARK: Methods
    @MainActor
    func fetchCharacters() async {
        state = .loading
        Task {
            do {
                let response: RMResponse = try await service.request(RickAndMortyRequest.characters)
                characters = response.results
                firstCharacters = Array(characters.prefix(5))
                state = .initial
            } catch let error as NetworkError {
                showAlert = true
                print(error.description)
            }
        }
    }
}
