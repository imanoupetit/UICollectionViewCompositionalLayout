//
//  CollectionViewController2.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 14/06/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//

import UIKit

/**
 Using content insets on items to set space between cells
 */
class CollectionViewController1: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CollectionViewController1"

        let itemSize = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1/5),
            heightDimension: NSCollectionLayoutDimension.fractionalHeight(1)
        )

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(1), top: .fixed(1), trailing: .fixed(1), bottom: .fixed(1))
        item.contentInsets = NSDirectionalEdgeInsets(top: 2.5, leading: 2.5, bottom: 2.5, trailing: 2.5)

        let groupSize = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.fractionalWidth(1/5)
        )

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 2.5, leading: 2.5, bottom: 2.5, trailing: 2.5)

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout

        collectionView.register(CollectionViewCell1.self, forCellWithReuseIdentifier: CollectionViewCell1.cellIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell1.cellIdentifier, for: indexPath) as! CollectionViewCell1
        return cell
    }

}

private class CollectionViewCell1: UICollectionViewCell {

    static let cellIdentifier = "CellIdentifier"

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .cyan
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
