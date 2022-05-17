//
//  PhotoModel.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/17.
//

import Foundation

struct PhotoModel: Identifiable, Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

