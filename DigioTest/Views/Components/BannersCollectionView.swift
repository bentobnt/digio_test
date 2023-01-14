//
//  BannersCollectionView.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 12/01/23.
//

import UIKit

protocol BannersCollectionViewDelegate: AnyObject {
    func didTapBanner(_ banner: Any, type: BannerType)
}

class BannersCollectionView: UIView {
    // MARK: - Views
    let viewContent: ContentView = {
        let view = ContentView()
        view.backgroundColor = .clear
        return view
    }()

    private var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 0
        stackView.axis = .vertical
        return stackView
    }()

    var labelTitle: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.font = .primaryExtraBold(ofSize: .extraLarge)
        label.textColor = .appPrimaryColor
        return label
    }()

    private var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 20

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = .white
        return collectionView
    }()

    // MARK: - Properties
    var viewModel: BannersCollectionViewModel? {
        didSet { setupData() }
    }

    weak var delegate: BannersCollectionViewDelegate?

    // MARK: - Init methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupCollectionView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    func setupData() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }

            self.collectionView.reloadData()
        }
    }

    func configure(with viewModel: BannersCollectionViewModel) {
        self.viewModel = viewModel
        setupTitle()
    }

    // MARK: Private methods
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(SpotlightCollectionViewCell.self,
                                forCellWithReuseIdentifier: SpotlightCollectionViewCell.uid())
        collectionView.register(ProductCollectionViewCell.self,
                                forCellWithReuseIdentifier: ProductCollectionViewCell.uid())
        collectionView.register(CashCollectionViewCell.self,
                                forCellWithReuseIdentifier: CashCollectionViewCell.uid())
    }

    private func getCellBannerForType(with indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel?.type {
        case .spotlight:
            return cellSpotlight(with: indexPath)
        case .product:
            return cellProduct(with: indexPath)
        case .cash:
            return cellCash(with: indexPath)
        default:
            return UICollectionViewCell()
        }
    }

    private func cellSpotlight(with indexPath: IndexPath) -> UICollectionViewCell {
        let uid = SpotlightCollectionViewCell.uid()
        // swiftlint: disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: uid,
                                                      for: indexPath) as! SpotlightCollectionViewCell
        if let viewModel = viewModel?.banner(for: indexPath.item,
                                             with: .spotlight) {
            cell.configure(with: viewModel as! SpotlightCollectionViewCellModel)
        }

        return cell
    }

    private func cellProduct(with indexPath: IndexPath) -> UICollectionViewCell {
        let uid = ProductCollectionViewCell.uid()
        // swiftlint: disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: uid,
                                                      for: indexPath) as! ProductCollectionViewCell
        if let viewModel = viewModel?.banner(for: indexPath.item,
                                             with: .product) {
            cell.configure(with: viewModel as! ProductCollectionViewCellModel)
        }

        return cell
    }

    private func cellCash(with indexPath: IndexPath) -> UICollectionViewCell {
        let uid = CashCollectionViewCell.uid()
        // swiftlint: disable force_cast
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: uid,
                                                      for: indexPath) as! CashCollectionViewCell
        if let viewModel = viewModel?.banner(for: indexPath.item,
                                             with: .cash) {
            cell.configure(with: viewModel as! CashCollectionViewCellModel)
        }

        return cell
    }

    private func setupTitle() {
        switch viewModel?.type {
        case .product:
            labelTitle.text = "Produtos"
        case .cash:
            labelTitle.text = "Digio Cash"
        case .spotlight:
            labelTitle.text = ""
        default:
            return
        }
    }
}

// MARK: - Create view
extension BannersCollectionView {
    private func setupView() {
        mainStackView.addArrangedSubview(labelTitle)
        mainStackView.addArrangedSubview(collectionView)

        viewContent.addSubview(mainStackView)

        addSubview(viewContent)

        viewContent.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        mainStackView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        labelTitle.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(10)
            make.height.equalTo(30)
        }

        collectionView.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom)
            make.right.left.bottom.equalToSuperview()
        }
    }
}

// MARK: - Collection view delegate
extension BannersCollectionView: UICollectionViewDelegate,
                                 UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.banners.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return getCellBannerForType(with: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if let banner = viewModel?.banners[indexPath.row] {
            delegate?.didTapBanner(banner, type: viewModel!.type)
        }
    }
}

extension BannersCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch viewModel?.type {
        case .spotlight:
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 180)
        case .product:
            return CGSize(width: 120, height: 120)
        case .cash:
            return CGSize(width: UIScreen.main.bounds.width - 20, height: 140)
        case .none:
            return CGSize.zero
        }
    }
}
