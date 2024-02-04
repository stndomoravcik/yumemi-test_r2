//
//  APIManager.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/03.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

enum APIError: Error {
    case noData
    case serialization
    case other(String)
    
    var errorMessage: String {
        switch self {
        case .noData:
            "Data not available"
        case .serialization:
            "Serialization Failure"
        case .other(let string):
            string
        }
    }
}

class APIManager {
    
    static let shared = APIManager()
    
    private var downloadTask: URLSessionTask?
    
    private func downloadData(_ url: URL, completion: @escaping (Result<Data, APIError>) -> Void) {
        
        downloadTask = URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let error = err {
                completion(.failure(.other(error.localizedDescription)))
                return
            }
            guard let data = data else {
                completion(.failure(.noData))
                return
            }
            completion(.success(data))
        }
        downloadTask?.resume()
    }
    
    func cancelSearch() {
        downloadTask?.cancel()
    }
    
    func searchGitRepositories(query: String, completion: @escaping (Result<[Repo], APIError>) -> Void) {
        guard let searchURL = URL(string: "https://api.github.com/search/repositories?q=\(query)") else {
            return
        }
        downloadData(searchURL) { result in
            switch result {
            case .success(let data):
                do {
                    guard let json = try JSONSerialization.jsonObject(with: data) as? [String : Any] else {
                        completion(.failure(.other("Wrong type")))
                        return
                    }
                    if let items = json["items"] as? [[String: Any]] {
                        let repos = items.map { item in
                            Repo(item)
                        }
                        completion(.success(repos))
                    } else {
                        completion(.failure(.other("Missing items key")))
                    }
                } catch {
                    completion(.failure(.serialization))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func getRepositoryImageData(_ imageURL: String, completion: @escaping (Result<Data, APIError>) -> Void){
        guard let url = URL(string: imageURL) else { return }
        downloadData(url, completion: completion)
    }
}
