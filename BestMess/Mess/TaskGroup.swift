//
//  TaskGroup.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/06/25.
//

import SwiftUI

actor TaskGroupDataManager {
    
    func fetchImages() async throws -> [UIImage] {
        let urlStrings = ["https://picsum.photos/200",
                          "https://picsum.photos/200",
                          "https://picsum.photos/200",
                          "https://picsum.photos/200"]
        
        
        return try await withThrowingTaskGroup(of: UIImage?.self) { group in
            var images: [UIImage] = []

            for urlString in urlStrings {
                group.addTask {
                    try? await self.fetchImage(urlString: urlString)
                }
            }
            
            for try await image in group {
                if let image = image {
                    images.append(image)
                }
            }
            return images
        }
        
    }
    
    private func fetchImage(urlString: String) async throws -> UIImage {
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let image = UIImage(data: data) {
                return image
            } else {
                throw URLError(.badURL)
            }
        } catch {
            throw error
        }
    }
}

class TaskGroupViewModel: ObservableObject {
    @Published var images: [UIImage] = []
    
    let dataManager = TaskGroupDataManager()
    
    
    func getImages() async {
        if let images = try? await dataManager.fetchImages() {
            self.images.append(contentsOf: images)
        }
    }
        
    
    
}

struct TaskGroup: View {
    
    @StateObject var vm = TaskGroupViewModel()
    
    let columns = [GridItem(.flexible()),
                   GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center) {
            ForEach(vm.images, id: \.self) { image in
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
            }
        }
        .task {
            await vm.getImages()
        }
    }
}

struct TaskGroup_Previews: PreviewProvider {
    static var previews: some View {
        TaskGroup()
    }
}
