//
//  DetailViewController.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit

class DetailViewController: UIViewController {

    let viewModel = DetailViewModel()
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
        
        detailView.dismissBtn.addTarget(self, action: #selector(dismissAction), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        detailView.blogLabel.addGestureRecognizer(tap)

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
        viewModel.binding = { [weak self] in
            if let detail = self?.viewModel.detail {
                DispatchQueue.main.async {
                    self?.detailView.setupView(detail: detail)
                    self?.detailView.layoutIfNeeded()
                }
            }
        }
    }
    
    @objc func dismissAction() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func tapAction() {
        if let url = URL(string: detailView.blogLabel.text ?? "") {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    deinit {
        print("DetailViewController deinit")
    }
}
