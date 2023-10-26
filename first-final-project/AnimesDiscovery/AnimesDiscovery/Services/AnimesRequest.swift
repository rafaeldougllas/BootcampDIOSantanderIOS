//
//  AnimesRequest.swift
//  AnimesDiscovery
//
//  Created by rafael douglas on 22/10/23.
//

import Foundation

public enum AnimesRequest: RequestProtocol {

    case animesList
    case anime(id: String)
    
    public var path: String {
        switch self {
        case .animesList:
            "recommendations/anime"
        case .anime(id: let id):
            "anime/\(id)"
        }
    }
    
    public var headers: [String : Any]? {
        return nil
    }
    
    public var queryItems: [URLQueryItem]? {
        return nil
    }
    
    public var body: [String : Any]? { nil }
    
}
