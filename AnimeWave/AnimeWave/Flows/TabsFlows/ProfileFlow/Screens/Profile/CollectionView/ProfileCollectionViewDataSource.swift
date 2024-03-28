//
//  Profile+CollectionView.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 28.03.2024.
//

import UIKit

class ProfileCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    // MARK: - Variables
    private var cellViewModels: [WatchingStatusCellViewModel]

    // MARK: - Init
    init(cellViewModels: [WatchingStatusCellViewModel]) {
        self.cellViewModels = cellViewModels
    }

    // MARK: - Functions
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: WatchingStatusCollectionViewCell.reuseIdentifier,
            for: indexPath
        ) as? WatchingStatusCollectionViewCell

        guard let cell else { return UICollectionViewCell() }
        cell.configureCell(viewModel: cellViewModels[indexPath.row])

        return cell
    }
}
