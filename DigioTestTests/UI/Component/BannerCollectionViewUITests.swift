//
//  BannerCollectionViewUITests.swift
//  DigioTestTests
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import XCTest
import SnapshotTesting
@testable import DigioTest

class BannerCollectionViewUITests: XCTestCase {
    // MARK: - Properties
    private var sut = BannersCollectionView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))

    func test_Cash_Banner() {
        sut.viewModel = BannersCollectionViewModel(banners: [Cash.fixture()], type: .cash)
        assertSnapshot(matching: sut, as: .image)
    }

    func test_Spotlight_Banner() {
        sut.viewModel = BannersCollectionViewModel(banners: [Spotlight.fixture()], type: .spotlight)
        assertSnapshot(matching: sut, as: .image)
    }

    func test_Product_Banner() {
        sut.viewModel = BannersCollectionViewModel(banners: [Product.fixture()], type: .product)
        assertSnapshot(matching: sut, as: .image)
    }
}
