//
//  HomeService.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import Foundation

protocol HomeServiceProtocol {
    func fetchHomeResponse(result: @escaping(Result<HomeResponse?, DigioError>) -> Void)
}

class HomeService: HomeServiceProtocol {
    private let mainURL = "https://7hgi9vtkdc.execute-api.sa-east-1.amazonaws.com/sandbox/products"

    func fetchHomeResponse(result: @escaping(Result<HomeResponse?, DigioError>) -> Void) {
        guard let url = URL(string: mainURL) else {
            return result(.failure(.invalidURL))
        }

        let task = URLSession.shared.dataTask(with: url) { data, response, _ in
            guard let data = data else {
                result(.failure(.genericError))
                return
            }

            do {
                if let response = try? JSONDecoder().decode(HomeResponse.self, from: data) {
                    result(.success(response))
                }
            }
        }
        task.resume()
    }
}
