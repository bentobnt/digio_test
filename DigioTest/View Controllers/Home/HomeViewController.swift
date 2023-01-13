//
//  HomeViewController.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import UIKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    private let viewMain: HomeView
    private let viewModel: HomeViewModel

    // MARK: - Coordinator
    weak var coordinator: MainCoordinator?

    // MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        self.viewMain = HomeView(viewModel: self.viewModel)

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - View methods
    override func loadView() {
        super.loadView()
        view = viewMain
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        setupViewModelBindings()
        viewModel.fetchData()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    // MARK: - Private methods
    private func setupViewModelBindings() {
        viewModel.didTapBanner = { [weak self] banner, type in
            self?.coordinator?.pushDetailsControllerWithType(type, banner: banner)
        }

        viewModel.isLoading = { [weak self] loading in
            self?.viewMain.viewContent.isLoading = loading
        }
    }
}

extension HomeViewController: HomeViewModelDelegate {
    func didFetchDataWithSuccess() {
        self.viewMain.setupData()
    }

    func didFetchDataWithError(error: String) {
        self.coordinator?.presentError(title: "Aconteceu algo errado!", message: error)
    }
}
