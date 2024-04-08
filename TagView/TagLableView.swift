//
//  TagLableView.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import SwiftUI

struct TagLableView<Tag: Taggable>: View {
    var tag: Tag
    
    var body: some View {
        Text(tag.title)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .foregroundStyle(.white)
            .background(.blue, in: .capsule(style: .circular))
            .layoutValue(key: Tag.layoutValueKey, value: tag.layoutValue)
    }
}

