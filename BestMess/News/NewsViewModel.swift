//
//  NewsViewModel.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/12.
//

import Foundation

@MainActor
class NewsViewModel: ObservableObject {

    
    @Published var articles = [News]()
    let service = NewsService()
    
    func fetchNews()  {
        if let news = try? service.fetchNews() {
            articles = news
        }
            
    }

    

}
