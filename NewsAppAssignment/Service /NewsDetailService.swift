//
//  NewsDetailService.swift
//  NewsAppAssignment
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import Foundation
// MARK: - News Details Service Protocol
/// Defines the methods required for fetching article engagement details.
protocol NewsDetailsServiceProtocol  {
    /// Fetches the number of likes for a given article.
    /// - Parameters:
    ///   - articlesID: The unique identifier for the article.
    ///   - completion: Closure returning the number of likes.
    func fetchLikes(articlesID: String, completion: @escaping (Int) -> Void)
    
    /// Fetches the number of comments for a given article.
    /// - Parameters:
    ///   - articlesID: The unique identifier for the article.
    ///   - completion: Closure returning the number of comments.
    func fetchComments(articlesID: String, completion: @escaping (Int) -> Void)
    
    
    /// Fetches the count from a given URL.
    /// - Parameters:
    ///   - url: The URL from which to fetch the count.
    ///   - completion: Closure returning the fetched count.
    func fetchCount(from url: URL, completion: @escaping (Int) -> Void )
}

// MARK: - News Details Service
/// Implements `NewsDetailsServiceProtocol` to fetch likes and comments for news articles.
class NewsDetailService : NewsDetailsServiceProtocol {
    
    /// Fetches the number of likes for a given article by calling the API.
    /// - Parameters:
    ///   - articlesID: The unique identifier for the article.
    ///   - completion: Closure returning the number of likes.
    func fetchLikes(articlesID: String, completion: @escaping (Int) -> Void) {
        let url = URL(string: "https://cn-news-info-api.herokuapp.com/likes/\(articlesID)")!
        fetchCount(from: url, completion: completion)
    }
    
    /// Fetches the number of comments for a given article by calling the API.
    /// - Parameters:
    ///   - articlesID: The unique identifier for the article.
    ///   - completion: Closure returning the number of comments.
    func fetchComments(articlesID: String, completion: @escaping (Int) -> Void) {
        let url = URL(string: "https://cn-news-info-api.herokuapp.com/comments/\(articlesID)")!
        fetchCount(from: url, completion: completion)
    }
    
    
    /// Fetches the count from a given URL and handles API response.
    /// - Parameters:
    ///   - url: The URL from which to fetch the count.
    ///   - completion: Closure returning the fetched count.
    func fetchCount(from url: URL, completion: @escaping (Int) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data, let responseString = String(data: data, encoding: .utf8)?.trimmingCharacters(in: .whitespacesAndNewlines), let count = Int(responseString) else {
                completion(0)
                return
            }
            completion(count)
        }.resume()
    }
}
