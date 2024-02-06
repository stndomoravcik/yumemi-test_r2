//
//  SearchViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/03.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

final class SearchViewModel: ObservableObject {
    
    private let apiManager = APIManager()
    
    @Published var repos: [Repo] = []
    
    func makeRepos(_ searchText: String) {
        apiManager.searchGitRepositories(with: searchText) { [weak self] items in
            DispatchQueue.main.async {
                self?.repos = items
            }
        }
    }
    
    func cancelSearch() {
        apiManager.cancelSearch()
    }
}
