//
//  NewsDetailView.swift
//  NewsAppAssignment
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import SwiftUI
import Kingfisher


//MARK: News Detail View
/// Displays detailed information  about the news article
/// - Parameters:
///  - image: Displays the image.
///  - description: Displays the description of the news article.
///  - likes and comments : Displays the likes and comments.

struct NewsDetailView: View {
    let article: NewsModel
    @StateObject private var detailViewModel: NewsDetailViewModel

    
    /// Initializes the NewsDetailView with the article and news service
    /// - Parameters:
    /// - article: The news Model object containing the article details
    /// - newsService : The service responsible for fetching the article details. Defaults to NewsDetailService().
    
    init(article: NewsModel, newsService: NewsDetailsServiceProtocol = NewsDetailService()) {
        self.article = article
        _detailViewModel = StateObject(wrappedValue: NewsDetailViewModel(newsService: newsService))
    }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                KFImage(URL(string: article.urlToImage ?? ""))
                    .resizable()
                    .placeholder {
                        ProgressView()
                            .frame(height: 200)
                    }
                    .frame(height: 200)
                    .cornerRadius(8)

                Text(article.title ?? "No Title")
                    .font(.title)
                    .bold()
                Text(article.description ?? "No Description Available")
                    .font(.body)
                    .padding(.vertical, 5)

                HStack {
                    Text("Likes: \(detailViewModel.likes)")
                    Text("Comments: \(detailViewModel.comments)")
                }
                .font(.headline)
                .padding()
            }
            .padding()
            .onAppear {
                detailViewModel.fetchArticleDetails(articleID: article.url?.replacingOccurrences(of: "https://", with: "").replacingOccurrences(of: "/", with: "-") ?? "")
            }
        }
    }
}
