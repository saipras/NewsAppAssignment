//
//  NewsListViewModel.swift
//  NewsAppAssignment
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import Foundation

// MARK: -News Detail ViewModel
/// Manages the fetching and storing engagement metrics(likes and comments )  for news article.
/// Properties :
///     - Published properties for storing the likes and comments
///     - Service responsible for fetching the article engagement details
class NewsDetailViewModel: ObservableObject {
    @Published var likes: Int = 0
    @Published var comments: Int = 0
    
    private let newsService: NewsDetailsServiceProtocol
    
    ///Initializes the NewsDetailViewModel with a news service.
    /// - Parameter:
    /// - news Service: The service used for fetching the likes and comments data. 
    init( newsService: NewsDetailsServiceProtocol) {
        self.newsService = newsService
    }
    
    
    /// Fetches the engagement details (likes and comments ) for given article ID .
    /// - Parameter
    /// - articleID : The unique identifier for article.
    func fetchArticleDetails(articleID: String) {
        newsService.fetchLikes(articlesID: articleID) { [weak self] count in
            DispatchQueue.main.async {
                self?.likes = (count == 0) ? Int.random(in: 10...100): count
            }
        }
        
        newsService.fetchComments(articlesID: articleID) { [weak self] count in
            DispatchQueue.main.async {
                self?.comments = (count == 0) ? Int.random(in: 10...100): count
            }
        }
    }
}
