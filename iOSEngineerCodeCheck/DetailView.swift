//
//  DetailView.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/05.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct DetailViewParam {
    let image: UIImage?
    let language: String
    let stargazers: String
    let watchers: String
    let forks: String
    let issues: String
}

struct DetailView: View {
    
    @StateObject var viewModel: DetailViewModel
    
    var body: some View {
        VStack {
            if let uiImage = viewModel.param.image {
                Image(uiImage: uiImage)
            }
            Text("Written in " + viewModel.param.language)
            Text(viewModel.param.stargazers + " stars")
            Text(viewModel.param.watchers + " watchers")
            Text(viewModel.param.forks + " forks")
            Text(viewModel.param.issues + " issues")
        }
    }
}
