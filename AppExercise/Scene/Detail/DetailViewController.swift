//
//  DetailViewController.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit

class DetailViewController: UIViewController {

    private let viewModel = ListViewModel()
    private var detailView = DetailView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        bind()
    }
    
    private func setupView() {
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(detailView)
        
        [
            detailView.topAnchor.constraint(equalTo: view.topAnchor),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ].forEach {
            $0.isActive = true
        }
    }
    
    private func bind() {
        viewModel.bindToDetailVC = { [weak self] in
            if let detail = self?.viewModel.detail {
                DispatchQueue.main.async {
                    self?.detailView.setupView(detail: detail)
                    self?.detailView.layoutIfNeeded()
                }
            }
        }
    }
    
    deinit {
        print("DetailViewController deinit")
    }
}
