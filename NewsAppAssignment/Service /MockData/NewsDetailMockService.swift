//
//  NewsDetailMockService.swift
//  NewsAppAssignment
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import Foundation

// MARK: - News Details Mock Service
/// A mock implementation of `NewsDetailsServiceProtocol` for testing purposes.
class NewsDetailMockService : NewsDetailsServiceProtocol {
    var likesCount = 50
    var commentsCount = 30
    
    
    /// Simulates fetching the number of likes for a given article.
    /// - Parameters:
    ///   - articlesID: The unique identifier for the article.
    ///   - completion: Closure returning the mocked number of likes.
    func fetchLikes(articlesID articleID: String, completion: @escaping (Int) -> Void) {
        completion(likesCount)
    }
    
    /// Simulates fetching the number of comments for a given article.
    /// - Parameters:
    ///   - articlesID: The unique identifier for the article.
    ///   - completion: Closure returning the mocked number of comments.
    func fetchComments(articlesID articleID: String, completion: @escaping (Int) -> Void) {
        completion(commentsCount)
    }
    
    /// Simulates fetching a count value from a given URL for testing.
    /// - Parameters:
    ///   - url: The URL from which to fetch the count.
    ///   - completion: Closure returning a predefined mock count.
    func fetchCount(from url: URL, completion: @escaping (Int) -> Void) {
        completion(42)
    }
}
