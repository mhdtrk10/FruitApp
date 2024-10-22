//
//  ContentView.swift
//  FruitApp
//
//  Created by Mehdi Oturak on 22.10.2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @StateObject var vm = CoreDataViewModel()
    @State var textfieldtext: String = ""

    

    var body: some View {
        
        NavigationView {
            VStack(spacing: 20) {
                TextField("Add fruits here.", text: $textfieldtext)
                    .font(.headline)
                    .padding(.leading)
                    .frame(height: 55)
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                
                    
                Button(action: {
                    guard !textfieldtext.isEmpty else { return }
                    vm.addFruit(text: textfieldtext)
                    textfieldtext = ""
                }, label: {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color(.systemPurple))
                        .cornerRadius(10)
                })
                .padding(.horizontal)
                
                Spacer()
                
                List {
                    ForEach(vm.savedEntities) { entity in
                        Text(entity.name ?? "No Name")
                            .onTapGesture {
                                vm.updateFruit(entity: entity)
                            }
                    }
                    .onDelete(perform: vm.deleteFruit)
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Fruits")
        }
        
        
    }


}



#Preview {
    ContentView()
}
