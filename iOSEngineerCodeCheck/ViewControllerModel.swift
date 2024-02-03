//
//  ViewControllerModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/04.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

class ViewControllerModel {
    
    private var apiManager = APIManager()
    
    func fetchGitRepository(with query: String, completion: @escaping ([Repo]) -> Void) {
        apiManager.searchGitRepositories(query: query, completion: completion)
    }
    
    func cancelFetchRepositories() {
        apiManager.cancelSearch()
    }
}
