//
//  HomeViewModel.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func didFetchDataWithSuccess()
    func didFetchDataWithError(error: String)
}

class HomeViewModel {
    // MARK: - Properties
    let service: HomeServiceProtocol
    var homeResponse: HomeResponse?

    // MARK: - delegate
    weak var delegate: HomeViewModelDelegate?

    // MARK: - Closures
    var didTapBanner: (Any, BannerType) -> Void = {_, _  in }
    var isLoading: (Bool) -> Void = {_ in }

    // MARK: - Init method
    init(service: HomeServiceProtocol) {
        self.service = service
    }

    // MARK: - Public methods
    func fetchData() {
        isLoading(true)
        service.fetchHomeResponse { [weak self] result in
            guard let self = self else { return }
            self.isLoading(false)
            switch result {
            case .success(let response):
                self.homeResponse = response
                self.delegate?.didFetchDataWithSuccess()
            case .failure(let error):
                self.delegate?.didFetchDataWithError(error: error.localizedDescription)
            }
        }
    }

    func getBannersCollectionViewModelWithType(_ type: BannerType) -> BannersCollectionViewModel {
        let viewModel: BannersCollectionViewModel
        switch type {
        case .spotlight:
            viewModel = BannersCollectionViewModel(banners: getBannersWithType(.spotlight), type: .spotlight)
        case .product:
            viewModel = BannersCollectionViewModel(banners: getBannersWithType(.product), type: .product)
        case .cash:
            viewModel = BannersCollectionViewModel(banners: getBannersWithType(.cash), type: .cash)
        }

        return viewModel
    }

    // MARK: - Private methods
    private func getBannersWithType(_ type: BannerType) -> [Any] {
        switch type {
        case .spotlight:
            return homeResponse?.spotlight ?? []
        case .product:
            return homeResponse?.products ?? []
        case .cash:
            return [homeResponse?.cash]
        }
    }
}
