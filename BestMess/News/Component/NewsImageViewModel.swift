//
//  NewsImageViewModel.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/16.
//
import SwiftUI
import Foundation

class NewsImageViewModel: ObservableObject {
    @Published var image: UIImage?
    
    @Published var isLoading = false
    
    let article: Article
    let service: PhotoService
    let manager = NewsImageCacheManager.instance
    
    init(article: Article) {
        self.article = article
        self.service = PhotoService(article: article)
    }
    
    func getImage() async {
        if let savedImage = manager.get(key: article.id) {
            self.image = savedImage
        } else {
            guard let urlStr = article.urlToImage else { return }
            self.image = await service.downloadImage(urlString: urlStr)
        }
    }
}
