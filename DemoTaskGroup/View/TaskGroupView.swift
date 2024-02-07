//
//  ContentView.swift
//  DemoTaskGroup
//
//  Created by Oleksandr Seminov on 2/6/24.
//

import SwiftUI

struct TaskGroupView: View {
    
    @StateObject private var viewModel = TaskGroupViewModel()
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.images, id: \.self) { image in
                        Image (uiImage: image)
                            .resizable ()
                            .scaledToFit()
                            .frame (height: 150)
                    }
                }
            }
            .navigationTitle("Async Let 🥳")
            .task {
                await viewModel.getImages()
            }
        }
    }
}

#Preview {
    TaskGroupView()
}
