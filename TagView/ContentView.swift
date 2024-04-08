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
                    TagLableResults(taggable: DDay.samples) { dday in
                        dday.label
                    }
                }
                .animation(.spring, value: containerWidth)
            }
            
            Spacer()
            
            TagLayout(taggableDataType: DDay.self) {
                TagLableResults(taggable: DDay.samples) { dday in
                    dday.label
                }
            }
            .animation(.bouncy(duration: 0.3) , value: containerWidth)
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
