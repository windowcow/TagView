//
//  ContentView.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import SwiftUI


struct ContentView: View {
    @State private var containerWidth: CGFloat = 200.0
    @State private var containerHeight: CGFloat = 100.0
    
    var body: some View {
        
        VStack(spacing: 0) {
            Spacer()

            ScrollView(.horizontal) {
                TagLayout(taggableDataType: DDay.self) {
                    TagLableResults(taggable: DDay.samples) { tagName in
                        TagLableView(tag: tagName)
                    }
                }
                
            }
            
            Spacer()
            
            TagLayout(taggableDataType: DDay.self) {
                TagLableResults(taggable: DDay.samples) { tagName in
                    TagLableView(tag: tagName)
                }
            }
            .background(.gray)
                
            .frame(maxWidth: containerWidth) // not
            
            Spacer()
            Slider(value: $containerWidth, in: 0...500)
        }
        
    }
}

#Preview {
    ContentView()
}
