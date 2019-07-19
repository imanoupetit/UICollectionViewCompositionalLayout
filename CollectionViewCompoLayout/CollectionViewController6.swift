//
//  CollectionViewController6.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 19/07/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//

import UIKit

/**
 Spotify style
 */
class CollectionViewController6: UICollectionViewController {

    var dataSource: UICollectionViewDiffableDataSource<Int, Int>!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CollectionViewController6"

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .none, top: .flexible(0), trailing: .none, bottom: .flexible(0))

        let groupSize = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .fractionalHeight(1))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = UICollectionLayoutSectionOrthogonalScrollingBehavior.groupPagingCentered

        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(section: section)
        collectionView.contentInsetAdjustmentBehavior = .scrollableAxes
        collectionView.insetsLayoutMarginsFromSafeArea = false
        collectionView.register(TextCell.self, forCellWithReuseIdentifier: TextCell.reuseIdentifier)

        dataSource = UICollectionViewDiffableDataSource<Int, Int>(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, identifier: Int) -> UICollectionViewCell? in

            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TextCell.reuseIdentifier, for: indexPath) as! TextCell
            cell.label.text = "\(indexPath.section), \(indexPath.item)"
            return cell
        }

        // initial data
        var snapshot = NSDiffableDataSourceSnapshot<Int, Int>()
        snapshot.appendSections([0])
        snapshot.appendItems(Array(0 ..< 30))
        dataSource.apply(snapshot, animatingDifferences: false)
    }

}
