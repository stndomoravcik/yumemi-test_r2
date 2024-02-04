//
//  SearchView.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/03.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var viewModel = SearchViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("リポジトリ名を入力してください", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding()
                    .onChange(of: searchText) { _ in
                        viewModel.cancelSearch()
                    }
                    .onSubmit {
                        viewModel.makeRepos(searchText)
                    }
                List {
                    ForEach(viewModel.repos, id: \.self) { item in
                        NavigationLink(item.fullName, destination: DetailView(viewModel: .init(repo: item)))
                    }
                }
            }
            .navigationTitle("GITリポジトリ検索")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}
