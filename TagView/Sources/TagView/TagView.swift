//
//  TagContainer.swift
//  TagView
//
//  Created by windowcow on 4/12/24.
//

import SwiftUI

public struct TagView<TagType: Hashable, PriorityType: Comparable, Content: View>: View {
    var horizontalSpacing: CGFloat
    var verticalSpacing: CGFloat
    
    var tags: [TagType]
    var priority: KeyPath<TagType, PriorityType>
    var singleTagLabel: (TagType) -> Content
    var reversed: Bool
    
    public init(horizontalSpacing: CGFloat = 10.0, verticalSpacing: CGFloat = 10.0, tags: [TagType] = [], priority: KeyPath<TagType, PriorityType>, reversed: Bool = false, @ViewBuilder singleTagLabel: @escaping (TagType) -> Content) {
        self.horizontalSpacing = horizontalSpacing
        self.verticalSpacing = verticalSpacing
        
        self.tags = tags
        self.priority = priority
        self.reversed = reversed
        self.singleTagLabel = singleTagLabel
    }
    
      
   public var body: some View {
        TagLayout(horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing) {
            ForEach(tags.sorted { (t1: TagType, t2: TagType) in
                reversed ? t1[keyPath: priority] > t2[keyPath: priority] : t1[keyPath: priority] < t2[keyPath: priority]
            }.enumerated().map{$0}, id: \.element) { tag in
                singleTagLabel(tag.element)
                    .layoutPriority(Double(tag.offset))
            }
        }
    }
}
