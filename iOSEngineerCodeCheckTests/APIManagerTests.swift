//
//  APIManagerTests.swift
//  iOSEngineerCodeCheckTests
//
//  Created by Moravcik Stanislav on 2024/02/05.
//  Copyright © 2024 YUMEMI Inc. All rights reserved.
//

import XCTest
@testable import iOSEngineerCodeCheck

class APIManagerTests: XCTestCase {
    // TODO: ダミーデータを返す（URLSessionをMock?）ように修正し、再テスト
    
    private let apiManager = APIManager.shared
    
    private func getRepo(_ name: String, completion: @escaping (Repo?) -> Void) {
        apiManager.searchGitRepositories(query: "yumemi") { result in
            switch result {
            case .success(let repo):
                completion(repo.first)
            case .failure(let failure):
                completion(nil)
            }
        }
    }
    
    func testFetchGitRepository() {
        let expectation = XCTestExpectation(description: "Fetch repositories")
        getRepo("yumemi") { result in
            if result == nil {
                XCTFail("Repo is nil")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
    
    func testGetRepositoryImageData() {
        let expectation = XCTestExpectation(description: "Fetch repositories")
        getRepo("yumemi") { [weak self] result in
            if let url = result?.avatarUrl {
                self?.apiManager.getRepositoryImageData(url) { data in
                    switch data {
                    case .success(let data):
                        let image = UIImage(data: data)
                        XCTAssertNotNil(image)
                    case .failure(let error):
                        XCTFail("Failed with error: \(error.localizedDescription)")
                    }
                }
            } else {
                XCTFail("Image URL is nil")
            }
            expectation.fulfill()
        }
        wait(for: [expectation], timeout: 3.0)
    }
}
