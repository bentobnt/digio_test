//
//  HomeViewModelDelegateSpy.swift
//  DigioTestTests
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import Foundation
@testable import DigioTest

class HomeViewModelDelegateSpy: HomeViewModelDelegate {
    private (set) var fetchResponseCalled: Bool = false

    func didFetchDataWithSuccess() {
        fetchResponseCalled = true
    }

    func didFetchDataWithError(error: String) {
        fetchResponseCalled = false
    }
}
