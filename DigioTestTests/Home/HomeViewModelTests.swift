//
//  HomeViewModelTests.swift
//  DigioTestTests
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import XCTest
@testable import DigioTest

class HomeViewModelTests: XCTestCase {
    // MARK: - Properties
    private let serviceSpy = HomeServiceSpy()
    private let delegateSpy = HomeViewModelDelegateSpy()
    private lazy var viewModel = HomeViewModel(service: serviceSpy)

    func test_fetchData_shouldCallService() {
        viewModel.fetchData()
        XCTAssertTrue(serviceSpy.fetchResponseCalled)
    }

    func test_fetchData_returnError() {
        serviceSpy.fetchResponseReturnError = .genericError
        viewModel.delegate = delegateSpy
        viewModel.fetchData()

        XCTAssertFalse(delegateSpy.fetchResponseCalled)
    }

    func test_fetchData_returnSuccess() {
        serviceSpy.fetchResponseReturnSuccess = .fixture()
        viewModel.delegate = delegateSpy
        viewModel.fetchData()

        XCTAssertTrue(delegateSpy.fetchResponseCalled)
    }

    func test_fetchData_returnCashBanner_withTitleEqual() {
        serviceSpy.fetchResponseReturnSuccess = .fixture()
        viewModel.fetchData()

        XCTAssertEqual(serviceSpy.fetchResponseReturnSuccess?.cash?.title, "digio Cash")
    }

    func test_fetchData_returnCashBanner_withNilTitle() {
        serviceSpy.fetchResponseReturnSuccess = .fixture(cash: .init(title: nil, bannerURL: nil, description: nil))
        viewModel.fetchData()

        XCTAssertEqual(serviceSpy.fetchResponseReturnSuccess?.cash?.title, nil)
    }
}
