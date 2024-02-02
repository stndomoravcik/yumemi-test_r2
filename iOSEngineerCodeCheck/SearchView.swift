//
//  SearchView.swift
//  iOSEngineerCodeCheck
//
//  Created by Moravcik Stanislav on 2024/02/03.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import SwiftUI

struct SearchView: View {
    
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
                        // TODO: 検索処理
                    }
                List {
                    // TODO: 一覧実装
                }
            }
        }
    }
}
