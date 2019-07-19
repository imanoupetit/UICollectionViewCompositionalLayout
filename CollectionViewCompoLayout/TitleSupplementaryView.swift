//
//  File.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 19/07/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//


import UIKit

class TitleSupplementaryView: UICollectionReusableView {

    let label = UILabel()
    static let reuseIdentifier = "title-supplementary-reuse-identifier"

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .lightGray
        
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.adjustsFontForContentSizeCategory = true
        let inset = CGFloat(10)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: inset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -inset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: inset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -inset)
        ])
        label.font = UIFont.preferredFont(forTextStyle: .headline)
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

}
