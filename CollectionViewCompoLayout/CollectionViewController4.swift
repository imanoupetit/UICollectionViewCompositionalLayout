//
//  CollectionViewController3.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 16/06/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//

import UIKit

/**
 Mimic a UITableView
 */
class CollectionViewController4: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CollectionViewController4"

        let itemSize = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.absolute(44)
        )

        // Item is a cell or a supplementary view
        // Has contentInsets & edgeSpacing properties
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        //        item.edgeSpacing = NSCollectionLayoutEdgeSpacing(
        //            leading: NSCollectionLayoutSpacing.fixed(5),
        //            top: .fixed(0),
        //            trailing: .fixed(5),
        //            bottom: .fixed(0)
        //        ) // does not work?

        let groupSize = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            //heightDimension: NSCollectionLayoutDimension.estimated(44) // .absolute(44)
            heightDimension: NSCollectionLayoutDimension.absolute(44)
        )

        // Group can be horizontal, vertical or custom
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        group.interItemSpacing = NSCollectionLayoutSpacing.fixed(20) // does not work?

        // Has contentInsets property
        let section = NSCollectionLayoutSection(group: group)
        //section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout

        collectionView.register(CollectionViewCell4.self, forCellWithReuseIdentifier: CollectionViewCell4.cellIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell4.cellIdentifier, for: indexPath) as! CollectionViewCell4
        cell.label.text = "\(indexPath)"
        return cell
    }

}

class CollectionViewCell4: UICollectionViewCell {

    static let cellIdentifier = "CellIdentifier"
    let label = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)

        label.backgroundColor = .orange
        label.numberOfLines = 0

        contentView.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        label.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor).isActive = true
        label.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor).isActive = true

        let line = UIView()
        line.backgroundColor = .lightGray

        contentView.addSubview(line)
        line.translatesAutoresizingMaskIntoConstraints = false
        line.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        line.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        line.heightAnchor.constraint(equalToConstant: 1).isActive = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
