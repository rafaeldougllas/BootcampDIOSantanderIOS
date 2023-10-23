//
//  RMResponse.swift
//  RickAndMorty
//
//  Created by rafael douglas on 20/10/23.
//

import Foundation

struct RMResponse: Codable {
    let info: RMInfo
    let results: [RMCharacter]
}
