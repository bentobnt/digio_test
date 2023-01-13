//
//  BannersCollectionViewModel.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 12/01/23.
//

import Foundation

class BannersCollectionViewModel {
    // MARK: - Properties
    var banners: [Any]
    var type: BannerType

    init(banners: [Any], type: BannerType) {
        self.banners = banners
        self.type = type
    }

    func banner(for index: Int, with type: BannerType) -> Any {
        switch type {
        case .spotlight:
            // swiftlint: disable force_cast
            return SpotlightCollectionViewCellModel(spotlight: banners[index] as! Spotlight)
        case .product:
            // swiftlint: disable force_cast
            return ProductCollectionViewCellModel(product: banners[index] as! Product)
        case .cash:
            // swiftlint: disable force_cast
            return CashCollectionViewCellModel(cash: banners[index] as! Cash)
        }
    }
}
