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
                TextField("", text: $searchText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocorrectionDisabled()
                    .padding()
                    .onChange(of: searchText) { _ in
                        // TODO: 中断処理
                    }
                    .onSubmit {
                        viewModel.makeRepos(searchText)
                    }
                List {
                    ForEach(viewModel.repos, id: \.self) { item in
                        Text(item.fullName)
                    }
                }
            }
        }
    }
}
