//
//  DetailsViewController.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import UIKit

class DetailsViewController: UIViewController {
    // MARK: - Properties
    private let viewMain: DetailsView
    private let viewModel: DetailsViewModel

    // MARK: - Init
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        self.viewMain = DetailsView(viewModel: self.viewModel)

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
        setupViewController()
    }

    // MARK: - Private methods
    private func setupViewController() {
        title = "Detalhes"
    }
}
