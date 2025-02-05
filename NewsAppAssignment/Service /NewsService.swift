//
//  NewsService.swift
//  NewsAppAssignment
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import Foundation

// MARK: -News Service Errors.
// Defines possible erros that may occur when fetching the news data.
enum NewsServiceError: Error {
    case invalidURL
    case noDataReceived
    case decodingFailed
}

// MARK: -News Service Protocol
// Defines the methods required for fetching the news articles.
///   Parameters :
///    - completion : Closure returing the `Result` with an array of  `News Model` or an `Error`.
protocol NewsServiceProtocol {
    func fetchNews(completion: @escaping (Result<[NewsModel], Error>) -> Void)
}


// MARK: - News Service
/// Implements `NewsServiceProtocol` to fetch news articles from an external API.
///  Parameters:
///       - completion: Closure returing the `Result` with an array of `NewsModel` or `Error`.
class NewsService: NewsServiceProtocol {
    func fetchNews(completion: @escaping (Result<[NewsModel], Error>) -> Void) {
        let apiKey = API.key
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiKey)"
        
        guard let url = URL(string: urlString) else {
            completion(.failure(NewsServiceError.invalidURL))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NewsServiceError.noDataReceived))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(ArticlesResponse.self, from: data)
                completion(.success(response.articles))
            } catch {
                completion(.failure(NewsServiceError.decodingFailed))
            }
        }.resume()
    }
}

