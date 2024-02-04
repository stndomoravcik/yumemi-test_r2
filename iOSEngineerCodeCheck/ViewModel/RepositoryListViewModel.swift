//
//  RepositoryListViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/04.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

class RepositoryListViewModel {
    
    private var apiManager = APIManager.shared
    
    func fetchGitRepository(with query: String, completion: @escaping ([Repo]) -> Void) {
        apiManager.searchGitRepositories(query: query, completion: completion)
    }
    
    func cancelFetchRepositories() {
        apiManager.cancelSearch()
    }
}
