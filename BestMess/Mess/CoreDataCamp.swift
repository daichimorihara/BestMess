//
//  CoreDataCamp.swift
//  BestMess
//
//  Created by Daichi Morihara on 2022/05/30.
//

import SwiftUI
import CoreData

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    @Published var savedEntities = [FruitEntity]()
    
    init() {
        container = NSPersistentContainer(name: "FruitsContainer")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error.localizedDescription)")
            } else {
                print("Successfully loaded core data")
            }
        }
        fetchFruits()
    }
    
    func fetchFruits() {
        let request = NSFetchRequest<FruitEntity>(entityName: "FruitEntity")
        
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch {
            print("Error fetching: \(error.localizedDescription)")
        }
    }
    
    func addFruit(text: String) {
        let newFruit = FruitEntity(context: container.viewContext)
        newFruit.name = text
        saveData()
    }
    
    func deleteFruit(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func updateFruit(entity: FruitEntity) {
        let currentName = entity.name ?? ""
        let newName = currentName + "!"
        entity.name = newName
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchFruits()
        } catch {
            print("Error saving: \(error.localizedDescription)")
        }
    }
    

    
}

struct CoreDataCamp: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State private var textFieldText = ""
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                
                TextField("Add fruit here...", text: $textFieldText)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color.gray)
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                Button {
                    guard !textFieldText.isEmpty else { return }
                    vm.addFruit(text: textFieldText)
                    textFieldText = ""
                } label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "Unknown")
                            .onTapGesture {
                                vm.updateFruit(entity: entity)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(PlainListStyle())
                
                Spacer()
                
            }
            .navigationTitle("Fruits")
        }
    }
}

struct CoreDataCamp_Previews: PreviewProvider {
    static var previews: some View {
        CoreDataCamp()
    }
}
