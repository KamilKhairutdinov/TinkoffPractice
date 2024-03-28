//
//  WatchingStatusCollectionViewCell.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 28.03.2024.
//

import UIKit

class WatchingStatusCollectionViewCell: UICollectionViewCell {

    // MARK: - UI elements
    private lazy var titleLabel: UILabel = {
        let label = labelFactory.createLabel(color: UIColor.cellTitle, font: UIFont.boldSystemFont(ofSize: 17))

        return label
    }()

    // MARK: - Variables
    private var labelFactory = LabelFactory()

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Configure UI
extension WatchingStatusCollectionViewCell {
    private func configureUI() {
        contentView.backgroundColor = .buttonAndTextField
        contentView.layer.cornerRadius = 8

        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(5)
            make.bottom.equalToSuperview().offset(-5)
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
        }
    }
}

extension WatchingStatusCollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }

    func configureCell(viewModel: WatchingStatusCellViewModel) {
        titleLabel.text = viewModel.title
    }
}
