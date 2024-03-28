//
//  CollectionViewFactory.swift
//  AnimeWave
//
//  Created by Камил Хайрутдинов on 28.03.2024.
//

import UIKit

class CollectionViewFactory {

    func createColletcionView(layout: UICollectionViewFlowLayout, dataSource: UICollectionViewDataSource) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.dataSource = dataSource
        collectionView.backgroundColor = .clear

        return collectionView
    }
}
