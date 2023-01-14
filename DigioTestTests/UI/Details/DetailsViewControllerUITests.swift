//
//  DetailsViewControllerUITests.swift
//  DigioTestTests
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import XCTest
import SnapshotTesting
@testable import DigioTest

class DetailsViewControllerUITests: XCTestCase {
    // MARK: - Properties
    private let viewModel = DetailsViewModel(banner: Product.fixture(),
                                             type: .product)
    private lazy var sut = DetailsViewController(viewModel: viewModel)

    func test_DetailsView() {
        assertSnapshot(matching: sut, as: .image(on: .iPhone8))
    }
}
