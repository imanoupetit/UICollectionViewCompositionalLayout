//
//  Cell.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 20/07/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//

import UIKit

class CyanViewCell: UICollectionViewCell {

    static let cellIdentifier = "CellIdentifier"

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = .cyan
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
