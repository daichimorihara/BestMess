//
//  ProfilePictureViewModel.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/17.
//

import Foundation
import UIKit
import Combine

class ProfilePictureViewModel: ObservableObject {
    @Published var image: UIImage?
    @Published var isLoading = false
    
    var cancellables = Set<AnyCancellable>()
    let manager = PhotoModelCacheManager.instance
    
    let urlString: String
    let imageKey: String
    
    init(url: String, key: String) {
        self.urlString = url
        self.imageKey = key
        getImage()
    }
    
    func getImage() {
        if let savedImage = manager.get(key: imageKey) {
            image = savedImage
            print("Getting saved image!")
        } else {
            downloadImage()
            print("Downloading image now!")
        }
    }
    
    func downloadImage() {
        isLoading = true
        guard let url = URL(string: urlString) else {
            isLoading = false
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] uiImage in
                guard
                    let self = self,
                    let image = uiImage else { return }
                
                self.image = image
                self.manager.add(key: self.imageKey, value: image)
            }
            .store(in: &cancellables)

    }
    
    
}
