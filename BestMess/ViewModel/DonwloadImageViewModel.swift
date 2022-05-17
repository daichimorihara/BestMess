//
//  DonwloadImageViewModel.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/17.
//

import Foundation
import Combine

class DownloadImageViewModel: ObservableObject {
    @Published var dataArray = [PhotoModel]()
    
    var cancellables = Set<AnyCancellable>()
    
    let dataService = PhotoModelDataService.instance
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$photoModels
            .sink { [weak self] photoModels in
                self?.dataArray = photoModels
            }
            .store(in: &cancellables)
            
    }
}
