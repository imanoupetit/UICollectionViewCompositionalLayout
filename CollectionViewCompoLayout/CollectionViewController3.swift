//
//  CollectionViewController3.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 18/06/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//

import UIKit

/**
 WIP
 Align left is the default for UICollectionViewCompositionalLayout.
 Can we set a right-alignment or center-alignment for a collectionView using UICollectionViewCompositionalLayout?
 */
class CollectionViewController3: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CollectionViewController3"

        let layout = UICollectionViewCompositionalLayout(sectionProvider: {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            let itemSize = NSCollectionLayoutSize(
                widthDimension: NSCollectionLayoutDimension.absolute(150),
                heightDimension: NSCollectionLayoutDimension.fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: nil, trailing: .fixed(0), bottom: nil)

            print(layoutEnvironment.container.contentSize)
            print(layoutEnvironment.container.effectiveContentSize)

            let groupSize = NSCollectionLayoutSize(
                widthDimension: NSCollectionLayoutDimension.absolute(layoutEnvironment.container.effectiveContentSize.width),
                heightDimension: NSCollectionLayoutDimension.fractionalWidth(1/5)
            )
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
            //group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .flexible(0), top: nil, trailing: nil, bottom: nil) // .fixed(0)

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 5
            section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
            return section
        })
        collectionView.collectionViewLayout = layout
        collectionView.register(CollectionViewCell3.self, forCellWithReuseIdentifier: CollectionViewCell3.cellIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell3.cellIdentifier, for: indexPath) as! CollectionViewCell3
        return cell
    }

}

private class CollectionViewCell3: UICollectionViewCell {

    static let cellIdentifier = "CellIdentifier"

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .cyan
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
