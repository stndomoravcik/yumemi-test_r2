//
//  RepositoryDetailViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/04.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

class RepositoryDetailViewModel {
    
    private var apiManager = APIManager.shared
    
    func fetchRepositoryImage(with urlString: String, completion: @escaping (Result<Data, APIError>) -> Void) {
        apiManager.getRepositoryImageData(urlString, completion: completion)
    }
}
