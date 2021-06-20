//
//  ListViewModel.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit

class ListViewModel {
    
    private let apiService = APIService()
    
    // MARK: - Bind to ListViewController -
    var pageSince: Int = 0 {
        didSet {
            getList(since: "\(pageSince)")
        }
    }
    private(set) var list: [User] = [] {
        didSet {
            bindToListVC()
        }
    }
    var bindToListVC: () -> Void = {}
    
    private func getList(since: String) {
        apiService.getListData(parameters: ["since": since, "per_page": "20"]) { [weak self] list in
            self?.list += list
        }
    }
    
    // MARK: - Bind to DetailViewController -
    var userName: String = "" {
        didSet {
            if userName != "" {
                getDetail(userName: userName)
            }
        }
    }
    private(set) var detail: Detail? {
        didSet {
            bindToDetailVC()
        }
    }
    var bindToDetailVC: () -> Void = {}
    
    private func getDetail(userName: String) {
        apiService.getDetailData(userName: userName) { [weak self] user in
            self?.detail = user
        }
    }
}
