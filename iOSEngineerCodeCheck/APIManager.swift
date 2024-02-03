//
//  APIManager.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/03.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

class APIManager {
    private var searchTask: URLSessionTask?
    
    func searchGitRepositories(with query: String, completion: @escaping ([Repo]) -> Void) {
        guard let searchURL = URL(string: "https://api.github.com/search/repositories?q=\(query)") else {
            return
        }
        searchTask = URLSession.shared.dataTask(with: searchURL) { (data, res, err) in
            if let error = err {
                print("Error: \(error)")
                return
            }
            guard let data = data else {
                print("Error: No data")
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                    print("Error: Wrong JSON format")
                    return
                }
                if let items = json["items"] as? [[String: Any]] {
                    let repos = items.map { item in
                        Repo(item)
                    }
                    completion(repos)
                } else {
                    print("Error: No items found")
                }
            } catch {
                print("Error: Serialization failure")
            }
        }
        searchTask?.resume()
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
        searchTask?.cancel()
    }
}
