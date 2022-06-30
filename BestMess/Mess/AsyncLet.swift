//
//  AsyncLet.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/06/25.
//

import SwiftUI



class AsyncLetViewModel: ObservableObject {
    
    @Published var dataArray: [UIImage?] = []
    
    func downloadImage() async -> UIImage? {
        guard let url = URL(string: "https://picsum.photos/200") else { return
            nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            return UIImage(data: data)
            
        } catch {
            print("FI")
        }
        return nil
    }
}

struct AsyncLet: View {
    
    @StateObject var vm = AsyncLetViewModel()
    
    var body: some View {
        VStack {
            
            ForEach(vm.dataArray, id: \.self) { image in
                if let image = image {
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                }
            }

        }
//        .onAppear {
//            Task {
//                async let image1 = vm.downloadImage()
//                async let image2 = vm.downloadImage()
//                async let image3 = vm.downloadImage()
//                async let image4 = vm.downloadImage()
//
//                let (left, right, center, top) = await(image1, image2, image3, image4)
//                vm.dataArray.append(contentsOf: [left, right, center, top])
//            }
//        }
        .onAppear{
            Task {
                let image1 = await vm.downloadImage()
                let image2 = await vm.downloadImage()
                let image3 = await vm.downloadImage()
                let image4 = await vm.downloadImage()
                
                vm.dataArray.append(contentsOf: [image1, image2, image3, image4])
            }
        }
    }
}

struct AsyncLet_Previews: PreviewProvider {
    static var previews: some View {
        AsyncLet()
    }
}
