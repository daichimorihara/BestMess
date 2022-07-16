//
//  NewsRow.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/16.
//

import SwiftUI

struct NewsRow: View {
    
    let article: Article
    
    var body: some View {
        HStack {
            Text(article.title ?? "")
                .multilineTextAlignment(.leading)
            
            
        }
    }
}

struct NewsRow_Previews: PreviewProvider {
    static var previews: some View {
        NewsRow(article: Article(title: "Elon VS Twitter. Why he wants to walk away.", url: "", urlToImage: ""))
    }
}
