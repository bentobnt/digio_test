//
//  CellsUITests.swift
//  DigioTestTests
//
//  Created by Bento luiz Rodrigues filho on 13/01/23.
//

import XCTest
import SnapshotTesting
@testable import DigioTest

class CellsUITests: XCTestCase {
    func test_CashCell() {
        let sut = CashCollectionViewCell(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        let viewModel = CashCollectionViewCellModel(cash: .fixture())
        sut.configure(with: viewModel)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_ProductCell() {
        let sut = ProductCollectionViewCell(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        let viewModel = ProductCollectionViewCellModel(product: .fixture())
        sut.configure(with: viewModel)

        assertSnapshot(matching: sut, as: .image)
    }

    func test_SpotlightCell() {
        let sut = SpotlightCollectionViewCell(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 200))
        let viewModel = SpotlightCollectionViewCellModel(spotlight: .fixture())
        sut.configure(with: viewModel)

        assertSnapshot(matching: sut, as: .image)
    }
}
