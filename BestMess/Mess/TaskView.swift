//
//  TaskView.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/07/06.
//

import SwiftUI

struct Message: Decodable, Identifiable {
    let id: Int
    let user: String
    let text: String
}

struct TaskView: View {
    @State private var messages = [Message]()
    @State private var selectedBox = 0
    let messageBoxes = ["Inbox", "Sent"]
    
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    ForEach(messages) { message in
                        VStack(alignment: .leading) {
                            Text(message.user)
                                .font(.headline)
                            Text(message.text)
                        }
                    }
                }
            }
            .navigationTitle(messageBoxes[selectedBox])
            .task(id: selectedBox) {
                await fetchData()
            }
            .toolbar {
                Picker("Select a message box", selection: $selectedBox) {
                    ForEach(messageBoxes.indices) { idx in
                        Text(messageBoxes[idx]).tag(idx)
                    }
                }
                .pickerStyle(.segmented)
            }
        }
    }
    
    
    func fetchData() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/\(messageBoxes[selectedBox].lowercased()).json") else {
            messages = [Message(id: 0, user: "Failed to load message box.", text: "Please try again later.")]
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            messages = try JSONDecoder().decode([Message].self, from: data)
        } catch {
            messages = [Message(id: 0, user: "Failed to load message box.", text: "Please try again later.")]
        }
        
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}
