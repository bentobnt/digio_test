//
//  HomeServiceSpy.swift
//  DigioTestTests
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import Foundation
@testable import DigioTest

class HomeServiceSpy: HomeServiceProtocol {
    private (set) var fetchResponseCalled: Bool = false

    var fetchResponseReturnError: DigioError?
    var fetchResponseReturnSuccess: HomeResponse?

    func fetchHomeResponse(result: @escaping (Result<HomeResponse?, DigioError>) -> Void) {
        fetchResponseCalled = true

        if fetchResponseReturnError != nil {
            result(.failure(fetchResponseReturnError ?? .genericError))
        } else {
            result(.success(fetchResponseReturnSuccess ?? nil))
        }
    }
}
