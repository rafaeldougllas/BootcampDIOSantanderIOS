//
//  RMLocation.swift
//  RickAndMorty
//
//  Created by rafael douglas on 20/10/23.
//

import Foundation

struct RMLocation: Codable, Identifiable, Hashable {
    let name: String
    let url: String
    
    var id: UUID { UUID() }
}

extension RMLocation {
    static func fixture(
            name: String = "Earth",
            url: String = "https://rickandmortyapi.com/api/location/20"
    ) -> RMLocation {
        return .init(name: name, url: url)
    }
}
