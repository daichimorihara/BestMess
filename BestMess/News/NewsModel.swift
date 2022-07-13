//
//  NewsModel.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/13.
//



import Foundation

// MARK: - Welcome
struct NewsModel: Decodable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]
}

// MARK: - Article
struct Article: Decodable, Identifiable {
    var id = UUID().uuidString
    
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Decodable {
    let id: String?
    let name: String?
}

