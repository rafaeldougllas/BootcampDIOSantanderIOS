//
//  RMCharacter.swift
//  RickAndMorty
//
//  Created by rafael douglas on 20/10/23.
//

import Foundation

struct RMCharacter: Codable, Identifiable, Hashable {
    let id: Int
    let name: String
    let status: RMCharacterStatus
    let species, type: String
    let gender: RMCharacterGender
    let origin, location: RMLocation
    let image: String
    let episode: [String]
    let url: String
    let created: String
}

extension RMCharacter {
    var imageUrl: URL {
        return URL(string: image)!
    }
}

extension RMCharacter {
    static func fixture(
        id: Int = 1,
        name: String = "Rick Sanchez",
        status: RMCharacterStatus = .alive,
        species: String = "Human",
        type: String = "",
        gender: RMCharacterGender = .male,
        origin: RMLocation = .fixture(),
        location: RMLocation = .fixture(url: "https://rickandmortyapi.com/api/location/20"),
        image: String = "https://rickandmortyapi.com/api/character/avatar/1.jpeg",
        episode: [String] = ["https://rickandmortyapi.com/api/episode/1",
                             "https://rickandmortyapi.com/api/episode/2"],
        url: String = "https://rickandmortyapi.com/api/character/1",
        created: String = "2017-11-04T18:48:46.250Z"
    ) -> RMCharacter {
        return .init(id: id,
                     name: name,
                     status: status,
                     species: species,
                     type: type,
                     gender: gender,
                     origin: origin,
                     location: location,
                     image: image,
                     episode: episode,
                     url: url,
                     created: created)
    }
}
