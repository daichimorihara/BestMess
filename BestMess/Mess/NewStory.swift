//
//  NewStory.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/05.
//

import SwiftUI

struct Story: Identifiable, Decodable {
    let id: Int
    let title: String
    let strap: String
    let url: URL
}

struct NewStory: View {
    
    @State private var stories = [Story]()
    
    var body: some View {
        List {
            ForEach(stories) { story in
                VStack {
                    Text(story.title)
                    Text(story.strap)
                }
            }
        }
        .task {
            await loadStories()
        }
    }
    
    
    func loadStories() async {
        do {
            stories = try await withThrowingTaskGroup(of: [Story].self) { group -> [Story] in
                for i in 1...5 {
                    group.addTask {
                        guard let url = URL(string: "https://hws.dev/news-\(i).json") else {
                            throw URLError(.badURL)
                        }
                        let (data, _) = try await URLSession.shared.data(from: url)
                        return try JSONDecoder().decode([Story].self, from: data)
                    }
                }
                let allStories = try await group.reduce(into: [Story]()) { $0 += $1 }
                return allStories.sorted(by: { $0.id > $1.id })
            }
        } catch {
            print("Failed to load stories")
        }
    }
}

struct NewStory_Previews: PreviewProvider {
    static var previews: some View {
        NewStory()
    }
}
