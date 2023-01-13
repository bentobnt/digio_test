//
//  DigioErrors.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

enum DigioError: Error {
    case genericError
    case invalidURL
    case network
}

extension DigioError {
    var localizedDescription: String {
        switch self {
        case .genericError:
            return "Desculpa estamos com problemas pra processar sua requisição, tente novamente mais tarde."
        case .invalidURL:
            return "O link que o aplicativo esta tentando acessar está errado, tente novamente mais tarde."
        case .network:
            return "Parece que você perdeu a conexão com internet!"
        }
    }
}
