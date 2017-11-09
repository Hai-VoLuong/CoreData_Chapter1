//
//  ViewController.swift
//  HitList
//
//  Created by Hai Vo L. on 11/9/17.
//  Copyright © 2017 Hai Vo L. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties
    var names: [String] = []

    // MARK: - Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The List"

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

    }

    // MARK: - IBAction
    @IBAction private func addName(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "New Name",message: "Add a new name", preferredStyle: .alert)
        let saveAction = UIAlertAction(title: "Save",  style: .default) { [unowned self] action in
            guard let textField = alert.textFields?.first,
                let nameToSave = textField.text else {
                return
            }
            self.names.append(nameToSave)
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .default)

        alert.addTextField()
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
}

