//
//  APIService.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import Foundation

class APIService {
    
    func getListData(completion: @escaping ([User]) -> Void) {
        let urlString = "https://api.github.com/users"
        
        if let url = URL(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data, let list = try? decoder.decode([User].self, from: data) {
                    completion(list)
                    print("data count: \(list.count)")
                } else {
                    print("error")
                }
            }.resume()
        }
    }
}
