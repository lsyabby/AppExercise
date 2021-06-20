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
        viewModel.binding = { [weak self] in
            self?.updateDataSource()
        }
    }
    
    private func updateDataSource() {
        dataSource = ListTableViewDataSource(cellIdentifier: UserTableViewCell.description(), items: viewModel.list, configureCell: { (cell, element) in
            cell.user = element
            cell.tapCell = { [weak self] login in
                let detailVC = DetailViewController()
                detailVC.viewModel.userName = login
                self?.present(detailVC, animated: true, completion: nil)
            }
        })
        
        DispatchQueue.main.async { [weak self] in
            self?.tableView.dataSource = self?.dataSource
            self?.tableView.reloadData()
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let isReachingEnd = scrollView.contentOffset.y >= 0 && scrollView.contentOffset.y >= (scrollView.contentSize.height - scrollView.frame.size.height)
        
        if tableView.dataSource != nil {
            if isReachingEnd, viewModel.pageSince + 20 < 100 {
                viewModel.pageSince += 20
            }
        }
    }

    deinit {
        print("ListViewController deinit")
    }
}

