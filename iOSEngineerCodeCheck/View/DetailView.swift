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
    let fullName: String
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
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding()
            } else {
                VSpacer(300)
            }
            Text(viewModel.repo.fullName)
                .font(.title)
                .lineLimit(1)
                .minimumScaleFactor(0.9)
            Text("Written in " + viewModel.param.language)
                .frame(maxWidth: .infinity, alignment: .leading)
                .font(.headline)
                .padding(.vertical, 5)
            Group {
                Text(viewModel.param.stargazers + " Stars")
                Text(viewModel.param.watchers + " Watchers")
                Text(viewModel.param.forks + " Forks")
                Text(viewModel.param.issues + " Issues")
            }
            .frame(maxWidth: .infinity, alignment: .trailing)
            .font(.subheadline)
            .padding(.vertical, 2)
        }
        .padding()
    }
}

#Preview {
    DetailView(viewModel: .init(repo: DummyData.dummyRepo))
}
