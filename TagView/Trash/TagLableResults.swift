//
//  SampleData.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI

//struct TagLableResults<TaggableType: Taggable, Content: View>: View {
//    var taggables: [TaggableType]
//    var content: (TaggableType) -> Content // No need of ViewBuilder 
//    
//    
//    // tag
//    init(taggables: [TaggableType], @ViewBuilder content: @escaping (TaggableType) -> Content) {
//        // ViewBuilder here is for result building the closure which has multiple TaggableType.lable
//        // so the viewbuilder for TaggableType.lable is needed when TaggableType.lable requires @ViewBuilder
//        self.taggables = taggables
//        self.content = content
//    }
//    
//    var body: some View {
//        ForEach(taggables, id: \.self) { taggable in
//            content(taggable)
//        }
//    }
//}
