//
//  PhotoService.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/16.
//

import Foundation
import UIKit

class PhotoService {
    
    let manager = NewsImageCacheManager.instance
    

    let article: Article
    init(article: Article) {
        self.article = article
    }
    
    func downloadImage(urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let image = UIImage(data: data) else { return nil }
            manager.add(key: article.id, value: image)
            return image
        } catch  {
            return nil
        }
        
    }
}
