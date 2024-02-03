//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var ImgView: UIImageView!
    
    @IBOutlet weak var TtlLbl: UILabel!
    
    @IBOutlet weak var LangLbl: UILabel!
    
    @IBOutlet weak var StrsLbl: UILabel!
    @IBOutlet weak var WchsLbl: UILabel!
    @IBOutlet weak var FrksLbl: UILabel!
    @IBOutlet weak var IsssLbl: UILabel!
    
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
        LangLbl.text = "Written in \(repo.language)"
        StrsLbl.text = "\(repo.stargazersCount) stars"
        WchsLbl.text = "\(repo.wachersCount) watchers"
        FrksLbl.text = "\(repo.forksCount) forks"
        IsssLbl.text = "\(repo.openIssuesCount) open issues"
        TtlLbl.text = repo.fullName
        
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
                    self.ImgView.image = image
                }
            }
        }
    }
    
}
