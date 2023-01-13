//
//  HomeView.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import UIKit

class HomeView: UIView {
    // MARK: - Views
    let viewContent: ContentView = {
        let view = ContentView()
        view.backgroundColor = .clear
        return view
    }()

    private var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        return scrollView
    }()

    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()

    private var spotlightCollectionView: BannersCollectionView = {
        let bannerCollection = BannersCollectionView()
        return bannerCollection
    }()

    private var cashCollectionView: BannersCollectionView = {
        let cashCollection = BannersCollectionView()
        cashCollection.labelTitle.isHidden = false
        return cashCollection
    }()

    private var productCollectionView: BannersCollectionView = {
        let productCollection = BannersCollectionView()
        productCollection.labelTitle.isHidden = false
        return productCollection
    }()

    // MARK: - Properties
    let viewModel: HomeViewModel

    // MARK: - Init
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    func setupData() {
        DispatchQueue.main.async { [weak self] in
            let spotlightViewModel = self?.viewModel.getBannersCollectionViewModelWithType(.spotlight)
            self?.spotlightCollectionView.configure(with: spotlightViewModel!)

            let productViewModel = self?.viewModel.getBannersCollectionViewModelWithType(.product)
            self?.productCollectionView.configure(with: productViewModel!)

            let cashViewModel = self?.viewModel.getBannersCollectionViewModelWithType(.cash)
            self?.cashCollectionView.configure(with: cashViewModel!)

            self?.setupAccessibility()
        }
    }
}

// MARK: - Create view
extension HomeView {
    private func getViewUser() -> UIView {
        let view = UIView()

        let image = UIImageView(image: UIImage(named: "image-user"))
        image.contentMode = .scaleAspectFit

        let label = UILabel()
        label.text = "Olá, Mundo"
        label.font = .primaryBold(ofSize: .large)
        label.textColor = .appPrimaryColor
        label.isAccessibilityElement = true
        label.accessibilityHint = "cabeçalho com o nome do usuário"
        label.adjustsFontForContentSizeCategory = true

        view.addSubview(image)
        view.addSubview(label)

        image.snp.makeConstraints { make in
            make.left.top.bottom.equalToSuperview().inset(10)
            make.width.equalTo(50)
        }

        label.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).offset(10)
            make.right.equalToSuperview()
            make.centerY.equalTo(image.snp.centerY)
        }

        return view
    }

    private func setupView() {
        let viewUser = getViewUser()
        mainStackView.addArrangedSubview(viewUser)
        mainStackView.addArrangedSubview(spotlightCollectionView)
        mainStackView.addArrangedSubview(cashCollectionView)
        mainStackView.addArrangedSubview(productCollectionView)

        viewContent.addSubview(mainStackView)
        scrollView.addSubview(viewContent)

        addSubview(scrollView)

        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        viewContent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.width.equalToSuperview()
        }

        mainStackView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(620)
        }

        viewUser.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.height.equalTo(60)
        }

        spotlightCollectionView.snp.makeConstraints { make in
            make.top.equalTo(viewUser.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.height.equalTo(190)
        }

        cashCollectionView.snp.makeConstraints { make in
            make.top.equalTo(spotlightCollectionView.snp.bottom).offset(10)
            make.left.right.equalToSuperview()
            make.height.equalTo(180)
        }

        productCollectionView.snp.makeConstraints { make in
            make.top.equalTo(cashCollectionView.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(165)
        }

        setupAdditionalConfiguration()
    }

    private func setupAdditionalConfiguration() {
        spotlightCollectionView.delegate = self
        productCollectionView.delegate = self
        cashCollectionView.delegate = self
    }

    private func setupAccessibility() {
        let spotlightBannersCount = viewModel.homeResponse?.spotlight?.count ?? 0
        let productsBannersCount = viewModel.homeResponse?.products?.count ?? 0

        spotlightCollectionView.isAccessibilityElement = true
        // swiftlint: disable line_length
        spotlightCollectionView.accessibilityHint = "Uma coleção dos nossos serviços com \(spotlightBannersCount) banners horizontais"
        spotlightCollectionView.accessibilityLabel = "Uma coleção dos nossos serviços com \(spotlightBannersCount) banners horizontais"

        productCollectionView.isAccessibilityElement = true
        // swiftlint: disable line_length
        productCollectionView.accessibilityHint = "Uma coleção dos nossos produtos com \(productsBannersCount) banners horizontais"
        productCollectionView.accessibilityLabel = "Uma coleção dos nossos produtos com \(productsBannersCount) banners horizontais"

        cashCollectionView.isAccessibilityElement = true
        cashCollectionView.accessibilityHint = "Um banner chamado digio cash para empréstimo de dinheiro"
        cashCollectionView.accessibilityLabel = "Um banner chamado digio cash para empréstimo de dinheiro"
    }
}

// MARK: - BannersCollectionView Delegate methods
extension HomeView: BannersCollectionViewDelegate {
    func didTapBanner(_ banner: Any, type: BannerType) {
        viewModel.didTapBanner(banner, type)
    }
}
