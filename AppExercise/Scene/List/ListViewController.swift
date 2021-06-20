//
//  ViewController.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit

class ListViewController: UIViewController, UITableViewDelegate {
    
    private let viewModel = ListViewModel()
    private let tableView = UITableView()
    private var dataSource: ListTableViewDataSource<UserTableViewCell, User>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        bind()
    }
    
    private func setupTableView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.delegate = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: UserTableViewCell.description())
        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.estimatedRowHeight = 92
        tableView.rowHeight = 92
        
        [
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    private func bind() {
        viewModel.bindToListVC = { [weak self] in
            self?.updateDataSource()
        }
    }
    
    private func updateDataSource() {
        dataSource = ListTableViewDataSource(cellIdentifier: UserTableViewCell.description(), items: viewModel.list, configureCell: { (cell, element) in
            cell.user = element
            cell.tapCell = { [weak self] login in
                self?.viewModel.userName = login
                let detailVC = DetailViewController()
                self?.present(detailVC, animated: true, completion: nil)
            }
        })
        
        DispatchQueue.main.async { [weak self] in
            self?.tableView.dataSource = self?.dataSource
            self?.tableView.reloadData()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        if offsetY > contentHeight - scrollView.frame.height - 50 {
            if viewModel.pageSince < 100 {
                viewModel.pageSince += 20
            }
        }
    }

    deinit {
        print("ListViewController deinit")
    }
}

