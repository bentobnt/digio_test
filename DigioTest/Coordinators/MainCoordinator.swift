//
//  MainCoordinator.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import UIKit

class MainCoordinator: CoordinatorController {
    // MARK: - View methods
    override func viewDidLoad() {
        super.viewDidLoad()
        start()
    }

    // MARK: - Private methods
    private func start() {
        let homeService = HomeService()
        let viewController = HomeViewController(viewModel: HomeViewModel(service: homeService))
        viewController.coordinator = self

        appNavigationController = NavigationController(rootViewController: viewController)
        install(appNavigationController!)
    }

    // MARK: - Public methods
    func pushDetailsControllerWithType(_ type: BannerType, banner: Any) {
        let viewModel = DetailsViewModel(banner: banner,
                                         type: type)
        let detailsViewController = DetailsViewController(viewModel: viewModel)
        appNavigationController?.pushViewController(detailsViewController, animated: true)
    }

    func presentError(title: String, message: String) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self?.appNavigationController?.present(alert, animated: true, completion: nil)
        }
    }
}
