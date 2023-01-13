//
//  DetailsViewModel.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import Foundation

class DetailsViewModel {
    // MARK: - Properties
    let type: BannerType
    let banner: Any

    // MARK: - Init method
    init(banner: Any, type: BannerType) {
        self.banner = banner
        self.type = type
    }

    // MARK: - Public methods
    func getBannerTitle() -> String {
        switch type {
        case .spotlight:
            let spotlightBanner = banner as? Spotlight
            return spotlightBanner?.name ?? ""
        case .product:
            let productBanner = banner as? Product
            return productBanner?.name ?? ""
        case .cash:
            let cashBanner = banner as? Cash
            return cashBanner?.title ?? ""
        }
    }

    func getBannerDescription() -> String {
        switch type {
        case .spotlight:
            let spotlightBanner = banner as? Spotlight
            return spotlightBanner?.description ?? ""
        case .product:
            let productBanner = banner as? Product
            return productBanner?.description ?? ""
        case .cash:
            let cashBanner = banner as? Cash
            return cashBanner?.description ?? ""
        }
    }
}
