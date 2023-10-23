//
//  NetworkError.swift
//  DiscoverNewAnime
//
//  Created by rafael douglas on 20/10/23.
//

import Foundation

public enum NetworkError: Error {
    case noResponse
    case connectionFail(statusCode: Int)
    case unknownError
    case parseCodable
    case invalidURL
    case badFormedBody
    
    var description: String {
        switch self {
        case .noResponse:
            "Resposta vazia."
        case .connectionFail(let statusCode):
            "Conexão falhou Code: \(statusCode)"
        case .unknownError:
            "Erro desconhecido!"
        case .parseCodable:
            "Erro no parse do Json"
        case .invalidURL:
            "URL inválida!"
        case .badFormedBody:
            "Body com formato inválido!"
        }
    }
}
