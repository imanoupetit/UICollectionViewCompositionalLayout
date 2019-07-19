//
//  CollectionView6.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 19/07/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//

import UIKit

/**
 WIP: Attempt to have cells constrained to the readable content margins.
 Link: https://stackoverflow.com/questions/45552279/uicollectionviewcontroller-flow-layout-with-readable-content-width/57048347#57048347

 */
class CollectionViewController8: UICollectionViewController {

    var layout: UICollectionViewCompositionalLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CollectionViewController8"

        layout = UICollectionViewCompositionalLayout(sectionProvider: {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            print("contentInsets:", layoutEnvironment.container.contentInsets)
            print("effectiveContentInsets:", layoutEnvironment.container.effectiveContentInsets)
            print("effectiveContentSize:", layoutEnvironment.container.effectiveContentSize)
            print("contentSize:", layoutEnvironment.container.contentSize)
            print("---")

            let itemSize = NSCollectionLayoutSize(
                widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
                //widthDimension: NSCollectionLayoutDimension.absolute(layoutEnvironment.container.contentSize.width - 100),
                heightDimension: NSCollectionLayoutDimension.fractionalHeight(1)
            )

            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            //item.edgeSpacing = NSCollectionLayoutEdgeSpacing(leading: .fixed(1), top: .fixed(1), trailing: .fixed(1), bottom: .fixed(1))

            let groupSize = NSCollectionLayoutSize(
                widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
                heightDimension: NSCollectionLayoutDimension.fractionalWidth(1/5)
            )

            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            group.interItemSpacing = NSCollectionLayoutSpacing.fixed(5)

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 5
            section.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5)

            return section
        })

        //collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.collectionViewLayout = layout
        collectionView.register(CyanViewCell.self, forCellWithReuseIdentifier: CyanViewCell.cellIdentifier)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CyanViewCell.cellIdentifier, for: indexPath) as! CyanViewCell
        return cell
    }

//    override func viewWillLayoutSubviews() {
//        print("view.readableContentGuide.layoutFrame:", view.readableContentGuide.layoutFrame)
//        print("collectionView.readableContentGuide.layoutFrame:", collectionView.readableContentGuide.layoutFrame)
//        print("---")
//        let xOrigin = view.readableContentGuide.layoutFrame.origin.x
//        //collectionView.layoutMargins = UIEdgeInsets(top: 0, left: xOrigin, bottom: 0, right: xOrigin)
//        collectionView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: xOrigin, bottom: 0, trailing: xOrigin)
//        collectionView.collectionViewLayout.invalidateLayout()
////        collectionView.invalidateIntrinsicContentSize()
//        //collectionView.layoutMargins = UIDirection//EdgeInsets(top: 0, left: xOrigin, bottom: 0, right: xOrigin)
//    }

//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        coordinator.animate(alongsideTransition: { (context) in
//            let xOrigin = self.view.readableContentGuide.layoutFrame.origin.x
//            //collectionView.layoutMargins = UIEdgeInsets(top: 0, left: xOrigin, bottom: 0, right: xOrigin)
//            self.collectionView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: xOrigin, bottom: 0, trailing: xOrigin)
//            self.collectionView.collectionViewLayout.invalidateLayout()
//        }, completion: nil)
//    }

}
