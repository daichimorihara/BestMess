//
//  TaskCamp.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/06/18.
//

import SwiftUI



class TaskCampViewModel: ObservableObject {
    
    @Published var image: UIImage?
    @Published var image2: UIImage?
    
    func fetchImage() async {
        try? await Task.sleep(nanoseconds:  2_000_000_000)
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            await MainActor.run(body: {
                self.image = UIImage(data: data)
            })
            print("Image fetched")
        } catch {
            print("Failed to fetch data")
        }
    }
    
    func fetchImage2() async {
        do {
            guard let url = URL(string: "https://picsum.photos/200") else { return }
            
            let (data, _) = try await URLSession.shared.data(from: url)
            self.image2 = UIImage(data: data)
        } catch {
            print("Failed to fetch data")
        }
    }
    
}

struct TaskHomeView: View {
    var body: some View {
        NavigationView {
            NavigationLink {
                TaskCamp()
            } label: {
                Text("Link to TaskCamp")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
            }

        }
    }
}

struct TaskCamp: View {
    
    @StateObject var vm = TaskCampViewModel()
    @State private var fetchImageTask: Task<(), Never>?
    
    var body: some View {
        VStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
            }
            if let image2 = vm.image2 {
                Image(uiImage: image2)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 200, height: 200)
            }
            
            
        }
        .task {
            await vm.fetchImage()
        }
//        .onAppear {
//            fetchImageTask = Task {
//                await vm.fetchImage()
//            }
//        }
//        .onDisappear {
//            fetchImageTask?.cancel()
//        }
    }
}

struct TaskCamp_Previews: PreviewProvider {
    static var previews: some View {
        TaskCamp()
    }
}
