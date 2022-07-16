//
//  PhotoManager.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/16.
//

import Foundation
import UIKit

class PhotoService {
    
    func fetchImage(urlString: String) async -> UIImage? {
        guard let url = URL(string: urlString) else { return nil }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            return UIImage(data: data)
        } catch  {
            return nil
        }
    }
}
