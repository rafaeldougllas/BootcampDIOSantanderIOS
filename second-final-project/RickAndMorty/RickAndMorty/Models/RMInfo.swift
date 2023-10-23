//
//  RMInfo.swift
//  RickAndMorty
//
//  Created by rafael douglas on 20/10/23.
//

import Foundation

struct RMInfo: Codable {
    let count, pages: Int
    let next: String?
    let prev: String?
}
