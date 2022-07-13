//
//  NewsViewModel.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/12.
//

import Foundation

@MainActor
class NewsViewModel: ObservableObject {
    @Published var articles = [Article]()
    
    @Published var messages = [Message]()
    
    @Published var news: NewsModel?
    
    let newsService = NewsService()
    
//    func fetchArticles() async {
//        if let returnedArticles = try? await newsService.fetchNews() {
//            articles = returnedArticles
//        }
//    }
    
    func fetchNews() {
        news = newsService.hufsi()
    }
    

    

}
