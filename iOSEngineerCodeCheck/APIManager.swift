//
//  APIManager.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/03.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

class APIManager {
    private var downloadTask: URLSessionTask?
    
    private func downloadData(_ url: URL, completion: @escaping (Data?) -> Void) {
        
        downloadTask = URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let error = err {
                print("Error: data download failed")
                completion(nil)
                return
            }
            completion(data)
        }
        downloadTask?.resume()
    }
    
    func cancelSearch() {
        downloadTask?.cancel()
    }
    
    func searchGitRepositories(query: String, completion: @escaping ([Repo]) -> Void) {
        guard let searchURL = URL(string: "https://api.github.com/search/repositories?q=\(query)") else {
            return
        }
        downloadData(searchURL) { data in
            guard let data = data else {
                completion([])
                return
            }
            do {
                guard let json = try JSONSerialization.jsonObject(with: data) as? [String : Any] else {
                    completion([])
                    return
                }
                if let items = json["items"] as? [[String: Any]] {
                    let repos = items.map { item in
                        Repo(item)
                    }
                    completion(repos)
                } else {
                    completion([])
                }
            } catch {
                completion([])
            }
        }
    }
    
    func getRepositoryImageData(_ imageURL: String, completion: @escaping (Data?) -> Void){
        guard let url = URL(string: imageURL) else { return }
        downloadData(url, completion: completion)
    }
}
