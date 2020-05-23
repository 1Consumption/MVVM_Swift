//
//  ViewController.swift
//  PRACTICEMVVM
//
//  Created by 신한섭 on 2020/05/17.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    fileprivate var viewModel: ViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewInteger))
        navigationItem.rightBarButtonItem = addButtonItem
        
        viewModel = ViewModel { [unowned self] (state) in
            switch state.editingStyle {
            case .none:
                self.tableView.reloadData()
            case let .insert(_, indexPath):
                self.tableView.beginUpdates()
                self.tableView.insertRows(at: [indexPath], with: .automatic)
                self.tableView.endUpdates()
            case let .delete(indexPath):
                self.tableView.beginUpdates()
                self.tableView.deleteRows(at: [indexPath], with: .automatic)
                self.tableView.endUpdates()
            }
        }
        
        tableView.dataSource = viewModel
    }

    @objc func addNewInteger() {
        viewModel?.addNewInteger()
    }

}
