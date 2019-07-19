//
//  ConllectionViewController9.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 20/07/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//

import UIKit

/**
 Autoresizing cells according to their text content.
 */
class CollectionViewController10: UICollectionViewController {

    var dataSource: UICollectionViewDiffableDataSource<Int, String>!

    let array = ["1", "1 2", "1 2 3 4 5 6 7 8", "1 2 3 4 5 6 7 8 9", "1 2 3", "1 2 3 4", "1 2 3 4 5 6", "1 2 3 4 5 6 7 8 9", "1 2 3 4", "1 2 3 4 5 6 7", "1 2 3 4 5 6 7 8 9 10 11 12 13 14 15", "1 2", "1 2 3 4 5", "1", "1 2 3 4 5 6"]

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CollectionViewController10"

        let itemSize = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.estimated(60),
            heightDimension: NSCollectionLayoutDimension.estimated(60)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: nil, top: .flexible(0), trailing: nil, bottom: .flexible(0))

        let groupSize = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.estimated(60)
        )
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)
        //group.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)
        //group.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .flexible(0), top: nil, trailing: .flexible(0), bottom: nil)

        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 5
        section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout

        collectionView.register(CollectionViewCell9.self, forCellWithReuseIdentifier: CollectionViewCell9.cellIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell9.cellIdentifier, for: indexPath) as! CollectionViewCell9
        cell.label.text = self.array[indexPath.row]
        return cell
    }

}

import UIKit

private class CollectionViewCell9: UICollectionViewCell {

    static let cellIdentifier = "CellIdentifier"

    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .orange
        label.preferredMaxLayoutWidth = 120
        label.numberOfLines = 2

        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        contentView.topAnchor.constraint(equalTo: label.topAnchor).isActive = true
        contentView.leadingAnchor.constraint(equalTo: label.leadingAnchor).isActive = true
        contentView.trailingAnchor.constraint(equalTo: label.trailingAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: label.bottomAnchor).isActive = true
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
