//
//  ContentView.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import SwiftUI


struct ContentView: View {
    @State private var containerWidth: CGFloat = 200.0
    
    var body: some View {
        
        VStack(spacing: 0) {
            Spacer()

            ScrollView(.horizontal) {
                TagLayout(taggableDataType: DDay.self) {
                    TagLableResults(taggables: DDay.samples) { dday in
                        dday.label
                    }
                }
                .animation(.spring, value: containerWidth)
                .padding()
            }
            .background(.cyan)
            
            Spacer()
            
            TagLayout(taggableDataType: DDay.self) {
                TagLableResults(taggables: DDay.samples) { dday in
                    dday.label
                }
            }
            .animation(.bouncy(duration: 0.3) , value: containerWidth)
            .padding()
            .background(.cyan)
                
            .frame(maxWidth: containerWidth) // not
            
            Spacer()
            Slider(value: $containerWidth, in: 0...500)
        }
        .background(.cyan.opacity(0.3))
        
    }
}

#Preview {
    ContentView()
}
