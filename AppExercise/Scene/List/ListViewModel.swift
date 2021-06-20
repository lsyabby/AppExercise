//
//  ListViewModel.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit

class ListViewModel {
    
    private let apiService = APIService()
    
    var pageSince: Int = 0 {
        didSet {
            getList(since: "\(pageSince)")
        }
    }
    
    private(set) var list: [User] = [] {
        didSet {
            binding()
        }
    }
    var binding: () -> Void = {}
    
    init() {
        getList(since: "\(pageSince)")
    }
    
    private func getList(since: String) {
        apiService.getListData(parameters: ["since": since, "per_page": "20"]) { [weak self] list in
            if list.count > 0 {
                self?.list += list
            }
        }
    }
}
