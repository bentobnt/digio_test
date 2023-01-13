//
//  SpotlightCollectionViewCell.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 12/01/23.
//

import UIKit

class SpotlightCollectionViewCell: UICollectionViewCell {
    // MARK: - Properties
    private var viewModel: SpotlightCollectionViewCellModel! {
        didSet { loadData() }
    }

    // MARK: - Views
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
    func configure(with viewModel: SpotlightCollectionViewCellModel) {
        self.viewModel = viewModel
    }

    // MARK: - Private methods
    private func loadData() {
        if let imageURL = viewModel.spotlight.bannerURL {
            bannerImageView.downloaded(from: imageURL)
            setupImageView()
        }
    }

    private func setupImageView() {
        bannerImageView.contentMode = .scaleToFill
        bannerImageView.layer.masksToBounds = false
        bannerImageView.layer.cornerRadius = 6
        bannerImageView.clipsToBounds = true
    }
}

// MARK: - Create view
extension SpotlightCollectionViewCell {
    private func setupView() {
        contentView.addSubview(bannerImageView)

        bannerImageView.snp.makeConstraints({ (make) in
            make.edges.equalToSuperview()
        })

        setupAdditionalConfiguration()
    }

    private func setupAdditionalConfiguration() {
        contentView.addCardShadow()
    }
}
