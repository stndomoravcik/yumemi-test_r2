//
//  APIManager.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/03.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

class APIManager {
    private let baseURL = "https://api.github.com/search/repositories"
    var task: URLSessionTask?
    
    func searchGitRepositories(with query: String, completion: @escaping ([Repo]) -> Void) {
        guard let url = URL(string: "\(baseURL)?q=\(query)") else {
            completion([])
            return
        }
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let items = json["items"] as? [[String: Any]] else {
                completion([])
                return
            }
            let repos = items.map { item in
                Repo(item)
            }
            completion(repos)
        }
        task?.resume()
    }
    
    func getRepositoryImageData(_ imageURL: String, completion: @escaping (Data?) -> Void){
        guard let url = URL(string: imageURL) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            guard let data = data else {
                completion(nil)
                return
            }
            completion(data)
        }.resume()
    }
    
    func cancelSearch() {
        task?.cancel()
    }
}
