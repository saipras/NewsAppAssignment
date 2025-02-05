//
//  NewsMockService.swift
//  NewsAppAssignment
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import Foundation

// MARK: - Mock News Service
/// A mock implementation of `NewsServiceProtocol` for testing purposes.
class MockNewsService: NewsServiceProtocol {
    var shouldReturnError = false
    var mockArticles: [NewsModel] = [
        NewsModel(source: nil, author: "Test Author", title: "Test Title", description: "Test Description", url: "https://test.com", urlToImage: "https://test.com/image.jpg")
    ]
    
    /// Simulates fetching news articles.
    /// - Parameter completion: Closure returning either a list of mock articles or an error.
    func fetchNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        if shouldReturnError {
            completion(.failure(NSError(domain: "Test Error", code: 1, userInfo: nil)))
        } else {
            completion(.success(mockArticles))
        }
    }
}
