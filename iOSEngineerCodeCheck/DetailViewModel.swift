//
//  DetailViewModel.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/05.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import SwiftUI

final class DetailViewModel: ObservableObject {
    
    private(set) var repo: Repo
    private let apiManager = APIManager()
    
    @Published var param: DetailViewParam
    
    init(repo: Repo) {
        self.repo = repo
        self.param = .init(image: nil, language: "", stargazers: "", watchers: "", forks: "", issues: "")
        
        self.makeParam()
    }
    
    func makeParam() {
        guard let avatarUrl = repo.avatarUrl else { return }
        apiManager.getRepositoryImageData(avatarUrl) { [weak self] data in
            guard let data = data, let uiImage = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self?.param = .init(
                    image: uiImage,
                    language: self?.repo.language ?? "",
                    stargazers: String(self?.repo.stargazersCount ?? 0),
                    watchers: String(self?.repo.wachersCount ?? 0),
                    forks: String(self?.repo.forksCount ?? 0),
                    issues: String(self?.repo.openIssuesCount ?? 0)
                )
            }
        }
    }
}
