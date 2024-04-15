//
//  ContentView.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import SwiftUI
import TagView

struct ContentView: View {
    @State private var tags: [SampleData] = SampleData.samples
    
    @State private var containerWidth: CGFloat = 300
    @State private var horizontalSpacing: CGFloat = 10.0
    @State private var verticalSpacing: CGFloat = 10.0
    @State private var isInsideScrollView = false
    
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.2)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Spacer(minLength: 1)
                if isInsideScrollView {
                    ScrollView(.horizontal) {
                        TagView(horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing, tags: tags, priority: \.value) { tag in
                            tag.label
                        }
                        .animation(.spring.speed(2), value: containerWidth)
                        .background(.gray)
                        .frame(maxWidth: containerWidth)
                    }
                    .scrollIndicators(.hidden)
                } else {
                    TagView(horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing, tags: tags, priority: \.value) { tag in
                        tag.label
                    }
                    .animation(.spring.speed(2), value: containerWidth)
                    .background(.gray)
                    .frame(maxWidth: containerWidth)
                }
                
                GroupBox {
                    Section("container frame max width: \(String(format: "%.f.2", containerWidth))") {
                        Slider(value: $containerWidth, in: 10.0...800) {
                            Text("ScrollViewHeight")
                        }
                    }
                    .monospaced()
                    
                    Section("spacing") {
                        
                        Stepper("horizontal: \(String(format: "%.f.2", horizontalSpacing))", value: $horizontalSpacing,
                                in: 0.0 ... 50.0,
                                step: 1.0)
                        
                        Stepper("vertical: \(String(format: "%.f.2", verticalSpacing))", value: $verticalSpacing,
                                in: 0.0 ... 50.0,
                                step: 1.0)
                        
                    }
                }
                .compositingGroup()
                .fixedSize()
                
                
            }
            
        }
    }
}

#Preview {
    ContentView()
}
