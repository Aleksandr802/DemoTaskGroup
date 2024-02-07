//
//  TaskGroupViewModel.swift
//  DemoTaskGroup
//
//  Created by Oleksandr Seminov on 2/6/24.
//

import Foundation
import UIKit

class TaskGroupViewModel: ObservableObject {
    
    @Published var images: [UIImage] = []
    let manager = TaskGroupDataManager()
    
    func getImages() async {
//        if let images = try? await manager.fetchImagesWithAsyncLet() {
//            self.images.append(contentsOf: images)
//        }
        
        if let images = try? await manager.fetchImageWithTaskGroup() {
            self.images.append(contentsOf: images)
        }
    }
}
