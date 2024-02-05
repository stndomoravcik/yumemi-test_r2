//
//  DummyData.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/05.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

struct DummyData {
    
    static var dummyRepo: Repo {
        
        let items: [String : Any] = ["full_name": "DummyRepo1", "language": "Swift", "stargazers_count": 100, "watchers_count": 50, "forks_count": 20, "open_issues_count": 5]
        return .init(items)
    }
}
