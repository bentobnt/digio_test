//
//  DetailsView.swift
//  DigioTest
//
//  Created by Bento luiz Rodrigues filho on 11/01/23.
//

import UIKit

class DetailsView: UIView {
    // MARK: - Views
    let viewContent: ContentView = {
        let view = ContentView()
        view.backgroundColor = .clear
        return view
    }()

    private var labelTitle: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.font = .primaryExtraBold(ofSize: .big)
        label.textColor = .appSecondaryColor
        label.textAlignment = .justified
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    private var labelDesc: UILabel = {
        let label = UILabel()
        label.numberOfLines = .zero
        label.font = .primaryBold(ofSize: .extraLarge)
        label.textColor = .appPrimaryColor
        label.textAlignment = .justified
        label.adjustsFontForContentSizeCategory = true
        return label
    }()

    // MARK: - Properties
    let viewModel: DetailsViewModel

    // MARK: - Init
    init(viewModel: DetailsViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Create DetailsView
extension DetailsView {
    private func setupView() {
        viewContent.addSubview(labelTitle)
        viewContent.addSubview(labelDesc)

        addSubview(viewContent)

        viewContent.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.right.left.equalTo(self)
        }

        labelTitle.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(20)
        }

        labelDesc.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(20)
            make.left.right.bottom.equalToSuperview().inset(20)
        }

        setupAdditionalConfiguration()
        setupAccessibility()
    }

    private func setupAdditionalConfiguration() {
        labelTitle.text = viewModel.getBannerTitle()
        labelDesc.text = viewModel.getBannerDescription()

    }

    private func setupAccessibility() {
        labelTitle.isAccessibilityElement = true
        labelDesc.isAccessibilityElement = true

        labelTitle.accessibilityHint = viewModel.getBannerTitle()
        labelDesc.accessibilityHint = viewModel.getBannerDescription()
    }
}
