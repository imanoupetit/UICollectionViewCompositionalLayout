//
//  TableViewController.swift
//  CollectionViewCompoLayout
//
//  Created by Imanou on 19/07/2019.
//  Copyright © 2019 Imanou Petit. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    let array: [UIViewController.Type] = [
        CollectionViewController0.self,
        CollectionViewController1.self,
        CollectionViewController2.self,
        CollectionViewController3.self,
        CollectionViewController4.self,
        CollectionViewController5.self,
        CollectionViewController6.self,
        CollectionViewController7.self,
        CollectionViewController8.self,
        CollectionViewController9.self,
        CollectionViewController10.self,
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Compositional layout"
        view.backgroundColor = UIColor.systemGroupedBackground
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellIdentifier", for: indexPath)
        cell.textLabel?.text = "CollectionView - example #\(indexPath.row)"
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let ControllerType = array[indexPath.row]

        let controller: UIViewController
        if let CollectionViewController = ControllerType as? UICollectionViewController.Type {
            let collectionViewController = CollectionViewController.init(collectionViewLayout: UICollectionViewLayout())
            collectionViewController.collectionView.backgroundColor = .systemBackground
            controller = collectionViewController
        } else {
            controller = ControllerType.init()
            controller.view.backgroundColor = .systemBackground
        }

        navigationController?.show(controller, sender: nil)
    }

}
