//
//  ContentView.swift
//  NewsAppAssignment
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import SwiftUI

// MARK: - Content View
/// Displays a list of news articles and allows navigation to detailed views.
struct ContentView: View {
    @StateObject var viewModel = NewsViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.articles) { article in
                NavigationLink(destination: NewsDetailView(article: article)) {
                    NewsCard(article: article)
                }
            }
            .listStyle(.inset)
            .navigationTitle("Latest News")
            .task {
                if viewModel.articles.isEmpty {
                    viewModel.fetchNews()
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
