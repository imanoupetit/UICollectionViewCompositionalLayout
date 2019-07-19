//
//  CollectionViewController2.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 19/07/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//

import UIKit

/**
 - Using section.interGroupSpacing to set space between cells
 - Using `NSCollectionLayoutGroup`'s `horizontal(layoutSize:subitem:count:)` to set a number of items per row
 */
class CollectionViewController2: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CollectionViewController2"

        let itemSize = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1), // this value will get overwritten by the number of item set for the group
            heightDimension: NSCollectionLayoutDimension.fractionalHeight(1)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(1), top: .fixed(1), trailing: .fixed(1), bottom: .fixed(1))

        let groupSize = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.fractionalWidth(1/5)
        )

        // Explicitly set a number of items for a group
        // this is an alterative to setting the itemSize to NSCollectionLayoutDimension.fractionalWidth(1/2)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout

        collectionView.register(CyanViewCell.self, forCellWithReuseIdentifier: CyanViewCell.cellIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CyanViewCell.cellIdentifier, for: indexPath) as! CyanViewCell
        return cell
    }

}
