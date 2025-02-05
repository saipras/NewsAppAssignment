//
//  NewsCardView.swift
//  NewsAppAssignment
//
//  Created by Sai Prasad Rekha on 05/02/25.
//

import SwiftUI
import Kingfisher

//MARK: News Card View
/// Display a summarized view of the news article in a horizontal stack .
struct NewsCard: View {
    let article: NewsModel
    
    var body: some View {
        HStack{
            KFImage(URL(string: article.urlToImage ?? ""))
                .resizable()
                .placeholder {
                    ProgressView()
                }
                .cornerRadius(10)
                .frame(maxWidth: 100, maxHeight: 100)
            
            VStack(alignment: .leading) {
                Text(article.title ?? "No Title")
                    .font(.headline)
                Text(article.author ?? "Unknown Author")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }.frame(maxWidth: .infinity, maxHeight: 100)
        }
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    NewsCard(article: MockData.sampleArticle)
        .background(Color.green)
        
}
