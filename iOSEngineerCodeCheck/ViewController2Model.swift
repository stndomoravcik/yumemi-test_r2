//
//  ViewController2Model.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/04.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import Foundation

class ViewController2Model {
    
    private var apiManager = APIManager()
    
    func fetchRepositoryImage(with urlString: String, completion: @escaping (Data?) -> Void) {
        apiManager.getRepositoryImageData(urlString, completion: completion)
    }
}
