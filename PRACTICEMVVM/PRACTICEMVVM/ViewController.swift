//
//  ViewController.swift
//  PRACTICEMVVM
//
//  Created by 신한섭 on 2020/05/17.
//  Copyright © 2020 신한섭. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate var model = [1, 2, 3]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.description())
        let addButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addNewInteger))
        navigationItem.rightBarButtonItem = addButtonItem
        tableView.dataSource = self
    }

    @objc func addNewInteger() {
        let number = Int(arc4random_uniform(10))
        model.append(number)
        model.sort()
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: model.firstIndex(of: number)!, section: 0)], with: .automatic)
        tableView.endUpdates()
    }

}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCell.description(), for: indexPath)
        cell.textLabel?.text = "\(model[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        guard editingStyle == .delete else { return }
        model.remove(at: indexPath.row)
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .automatic)
        tableView.endUpdates()
    }
}
