//
//  ProductCollectionViewCell.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 12/01/23.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    private var viewModel: ProductCollectionViewCellModel! {
        didSet { loadData() }
    }

    // MARK: - Views
    private var content: ContentView = {
        let content = ContentView()
        content.layer.masksToBounds = false
        content.clipsToBounds = true
        content.layer.cornerRadius = 6
        content.backgroundColor = .white
        return content
    }()

    private var bannerImageView: UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()

    // MARK: - Init methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public methods
    func configure(with viewModel: ProductCollectionViewCellModel) {
        self.viewModel = viewModel
    }

    // MARK: - Private methods
    private func loadData() {
        if let imageURL = viewModel.product.imageURL {
            bannerImageView.downloaded(from: imageURL,
                                       contentMode: .scaleAspectFill)
        }
    }
}

// MARK: - Create view
extension ProductCollectionViewCell {
    private func setupView() {
        content.addSubview(bannerImageView)
        contentView.addSubview(content)

        content.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })

        bannerImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(30)
        }

        setupAdditionalConfiguration()
    }

    private func setupAdditionalConfiguration() {
        contentView.addCardShadow()
    }
}
