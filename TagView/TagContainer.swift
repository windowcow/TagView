//
//  TagContainer.swift
//  TagView
//
//  Created by windowcow on 4/12/24.
//

import SwiftUI

struct TagContainer<T: Hashable, ID: Comparable, Content: View>: View {
    var horizontalSpacing: CGFloat
    var verticalSpacing: CGFloat
    
    var tags: [T]
    var priority: KeyPath<T, ID>
    var singleTagLabel: (T) -> Content
    
    
    // Tags must be already sorted
    init(horizontalSpacing: CGFloat = 10.0, verticalSpacing: CGFloat = 10.0, tags: [T], priority: KeyPath<T, ID>, reverse: Bool = false, @ViewBuilder singleTagLabel: @escaping (T) -> Content) {
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        
        self.tags = tags.sorted { (tag1: T, tag2: T) in
            if !reverse {
                tag1[keyPath: priority] > tag2[keyPath: priority]
            } else {
                tag1[keyPath: priority] < tag2[keyPath: priority]
            }
            
        }
        self.priority = priority
        self.singleTagLabel = singleTagLabel
    }
    
      
    var body: some View {
        TagLayout(horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing) {
            ForEach(tags, id: \.self) { tag in
                singleTagLabel(tag)
            }
        }
        
    }
}

#Preview {
    ContentView()
}
