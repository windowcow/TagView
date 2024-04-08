//
//  SampleData.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI

struct TagLableResults<Content: View, TaggableType: Taggable>: View {
    var taggable: [TaggableType]
    @ViewBuilder var content: (TaggableType) -> Content

    var body: some View {
        ForEach(taggable, id: \.self, content: content)
    }
}
