//
//  DetailViewModel.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import UIKit

class DetailViewModel {
    
    private let apiService = APIService()
    
    var userName: String = "" {
        didSet {
            if userName != "" {
                getDetail(userName: userName)
            }
        }
    }
    
    private(set) var detail: Detail? {
        didSet {
            binding()
        }
    }
    var binding: () -> Void = {}
    
    private func getDetail(userName: String) {
        apiService.getDetailData(userName: userName) { [weak self] user in
            self?.detail = user
        }
    }
}
