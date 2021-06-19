//
//  ListViewModel.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit

class ListViewModel {
    
    private let apiService = APIService()
    private(set) var list: [User] = [] {
        didSet {
            binding()
        }
    }
    var binding: () -> Void = {}
    
    init() {
        getList()
    }
    
    private func getList() {
        apiService.getListData { [weak self] list in
            self?.list = list
        }
    }
}
