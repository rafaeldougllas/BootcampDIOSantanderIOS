//
//  DetailViewModel.swift
//  RickAndMorty
//
//  Created by rafael douglas on 21/10/23.
//

import Foundation

class DetailViewModel: ObservableObject {
    @Published var character: RMCharacter
    
    init(character: RMCharacter) {
        self.character = character
    }
}
