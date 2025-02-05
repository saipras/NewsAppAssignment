//
//  NewsViewModel.swift
//  NewsAppAssignment
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import Foundation
// MARK: -News View Model
/// Manages fetching and storing a list of news articles.
///  Parameters:
///    - Published property for storing a list of fetched news articles.
///    - Service responsible for fetching the news data.
class NewsViewModel: ObservableObject {
    @Published var articles: [NewsModel] = []
    private let newsService: NewsServiceProtocol
    
    
    /// Initializs the news service
    ///  - Parameter:
    ///  - newsService: The service used to fetch the articles .
    init(newsService: NewsServiceProtocol = NewsService()) {
        self.newsService = newsService
    }
    
    ///Fetches the news articles and updates the `articles` property.
    func fetchNews() {
        newsService.fetchNews { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                    self?.articles = articles
                case .failure(let error):
                    print("Error fetching news: \(error.localizedDescription)")
                }
            }
        }
    }
}
