//
//  RickAndMortyRequest.swift
//  DiscoverNewAnime
//
//  Created by rafael douglas on 20/10/23.
//

import Foundation

public enum RickAndMortyRequest: RequestProtocol {

    case characters
    case character(id: Int)
    
    public var path: String {
        switch self {
        case .characters:
            "/api/character"
        case .character(id: let id):
            "/api/character/\(id)"
        }
    }
    
    public var headers: [String : Any]? {
        if let token = Bundle.main.object(forInfoDictionaryKey: "X-Api-Key") as? String {
            return ["X-Api-Key": token]
        }
        return nil
    }
    
    public var queryItems: [URLQueryItem]? {
        return nil
    }
    
    public var body: [String : Any]? { nil }
    
}
