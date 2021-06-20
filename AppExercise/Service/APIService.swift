//
//  APIService.swift
//  AppExercise
//
//  Created by 李思瑩 on 2021/6/20.
//

import Foundation

class APIService {
    
    func getListData(parameters: [String: String], completion: @escaping ([User]) -> Void) {
        let urlString = "https://api.github.com/users"
        
        var components = URLComponents(string: urlString)!
        components.queryItems = parameters.map { (key, value) in
            URLQueryItem(name: key, value: value)
        }
        components.percentEncodedQuery = components.percentEncodedQuery?.replacingOccurrences(of: "+", with: "%2B")
        let request = URLRequest(url: components.url!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let data = data, let list = try? decoder.decode([User].self, from: data) {
                completion(list)
                print("data count: \(list.count)")
            } else {
                print("error: \(error.debugDescription)")
            }
        }.resume()
    }
    
    func getDetailData(userName: String, completion: @escaping (Detail) -> ()) {
        let urlString = URL(string: "https://api.github.com/users/\(userName)")
        if let url = urlString {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                if let data = data, let user = try? decoder.decode(Detail.self, from: data) {
                    completion(user)
                    print("success get detail data")
                } else {
                    print("error: \(error.debugDescription)")
                }
            }.resume()
        }
    }
}
