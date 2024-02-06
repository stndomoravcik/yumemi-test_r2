//
//  Repo.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/03.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

struct Repo: Hashable {
    
    static func == (lhs: Repo, rhs: Repo) -> Bool {
        lhs.fullName == rhs.fullName
    }
    
    private let items: [String: Any]
    
    init(_ items: [String: Any]) {
        self.items = items
    }
    
    var owner: [String: Any] {
        return items["owner"] as? [String: Any] ?? [:]
    }
    
    var avatarUrl: String? {
        return owner["avatar_url"] as? String
    }
    
    var fullName: String {
        return items["full_name"] as? String ?? ""
    }
    
    var language: String {
        return items["language"] as? String ?? ""
    }
    
    var stargazersCount: Int {
        return items["stargazers_count"] as? Int ?? 0
    }
    
    var watchersCount: Int {
        return items["watchers_count"] as? Int ?? 0
    }
    
    var forksCount: Int {
        return items["forks_count"] as? Int ?? 0
    }
    
    var openIssuesCount: Int {
        return items["open_issues_count"] as? Int ?? 0
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(fullName)
        hasher.combine(language)
        hasher.combine(stargazersCount)
        hasher.combine(watchersCount)
        hasher.combine(forksCount)
        hasher.combine(openIssuesCount)
    }
}
