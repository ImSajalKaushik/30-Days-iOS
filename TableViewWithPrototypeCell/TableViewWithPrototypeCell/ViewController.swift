//
//  ViewController.swift
//  TableViewWithPrototypeCell
//
//  Created by Sajal Kaushik on 07/05/20.
//  Copyright © 2020 Sajal Kaushik. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tabelview: UITableView!
    
    var dataSourceForRow = Array("abcdefghijklmnopqrstuvwxyz")
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableview()
    }
    
    
    func setupTableview() {
        self.tabelview.dataSource = self
        self.tabelview.delegate = self
        tabelview.backgroundColor = .clear
        self.view.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        tabelview.separatorColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        tabelview.allowsSelection = false
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSourceForRow.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = String(dataSourceForRow[indexPath.row])
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .white
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            dataSourceForRow.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .top)
        }
    }
}
