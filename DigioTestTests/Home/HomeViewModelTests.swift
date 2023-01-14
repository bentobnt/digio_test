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
    private lazy var sut = HomeViewModel(service: serviceSpy)

    func test_fetchData_shouldCallService() {
        sut.fetchData()
        XCTAssertTrue(serviceSpy.fetchResponseCalled)
    }

    func test_fetchData_returnError() {
        serviceSpy.fetchResponseReturnError = .genericError
        sut.delegate = delegateSpy
        sut.fetchData()

        XCTAssertFalse(delegateSpy.fetchResponseCalled)
    }

    func test_fetchData_returnSuccess() {
        serviceSpy.fetchResponseReturnSuccess = .fixture()
        sut.delegate = delegateSpy
        sut.fetchData()

        XCTAssertTrue(delegateSpy.fetchResponseCalled)
    }

    func test_fetchData_returnCashBanner_withTitleEqual() {
        serviceSpy.fetchResponseReturnSuccess = .fixture()
        sut.fetchData()

        XCTAssertEqual(serviceSpy.fetchResponseReturnSuccess?.cash?.title, "digio Cash")
    }

    func test_fetchData_returnCashBanner_withNilTitle() {
        serviceSpy.fetchResponseReturnSuccess = .fixture(cash: .init(title: nil, bannerURL: nil, description: nil))
        sut.fetchData()

        XCTAssertEqual(serviceSpy.fetchResponseReturnSuccess?.cash?.title, nil)
    }
}
