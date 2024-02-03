//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var repositoryImage: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var stargazersLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var forksCountLabel: UILabel!
    @IBOutlet weak var issuesCountLabel: UILabel!
    
    var repository: Repo?
    private var apiManager = APIManager()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScreenData()
    }
    
    func updateScreenData() {
        guard let repo = repository else {
            return
        }
        languageLabel.text = "Written in \(repo.language)"
        stargazersLabel.text = "\(repo.stargazersCount) stars"
        watchersLabel.text = "\(repo.wachersCount) watchers"
        forksCountLabel.text = "\(repo.forksCount) forks"
        issuesCountLabel.text = "\(repo.openIssuesCount) open issues"
        titleLabel.text = repo.fullName
        
        if let imgURL = repo.avatarUrl {
            getImage(imgURL)
        }
    }
    
    func getImage(_ avatarURL: String){
        apiManager.getRepositoryImageData(avatarURL) { imageData in
            guard let imageData = imageData else {
                return
            }
            if let image = UIImage(data: imageData) {
                DispatchQueue.main.async {
                    self.repositoryImage.image = image
                }
            }
        }
    }
    
}
