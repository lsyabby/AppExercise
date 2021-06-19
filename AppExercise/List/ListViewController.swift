//
//  ViewController.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate {
    
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setupTableView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.backgroundColor = .brown
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        
        [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ].forEach {
            $0.isActive = true
        }
    }

    deinit {
        print("ListViewController deinit")
    }
}

