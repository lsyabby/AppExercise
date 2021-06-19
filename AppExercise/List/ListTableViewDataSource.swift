//
//  ListTableViewDataSource.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit

class ListTableViewDataSource<CELL: UITableViewCell, T>: NSObject, UITableViewDataSource {
    
    private var cellIdentifier: String
    private var items: [T] = []
    var configureCell: (CELL, T) -> Void = { _, _ in }
    
    init(cellIdentifier: String, items: [T], configureCell: @escaping (CELL, T) -> Void) {
        self.cellIdentifier = cellIdentifier
        self.items = items
        self.configureCell = configureCell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CELL else { return UITableViewCell() }
        let item = items[indexPath.row]
        configureCell(cell, item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let cell = cell as? UserTableViewCell, let user = items[indexPath.row] as? User else { return }
        cell.user = user
    }
}
