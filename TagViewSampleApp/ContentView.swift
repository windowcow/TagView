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
    @State private var sortOrder = false
    
    var body: some View {
        ZStack {
            Color.cyan.opacity(0.2)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                ScrollView(.horizontal) {
                    TagView(horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing, tags: tags, priority: sortOrder ?  \.value : \.count) { tag in
                        tag.label
                    }
                    .background(.gray)
                }
                .scrollIndicators(.hidden)
                
                TagView(horizontalSpacing: horizontalSpacing, verticalSpacing: verticalSpacing, tags: tags, priority: sortOrder ?  \.value : \.count) { tag in
                    tag.label
                }
                .background(.gray)
                .frame(maxWidth: containerWidth)
                
                TagViewForm(sortOrder: $sortOrder, containerWidth: $containerWidth, horizontalSpacing: $horizontalSpacing, verticalSpacing: $verticalSpacing)
                    .animation(.none, value: sortOrder)
                    .animation(.none, value: containerWidth)
            }
            .animation(.spring.speed(2), value: sortOrder)
            .animation(.spring.speed(2), value: containerWidth)
            .animation(.spring.speed(2), value: horizontalSpacing)
            .animation(.spring.speed(2), value: verticalSpacing)
        }
    }
}

struct TagViewForm: View {
    @Binding var sortOrder: Bool
    @Binding var containerWidth: CGFloat
    @Binding var horizontalSpacing: CGFloat
    @Binding var verticalSpacing: CGFloat
    
    var body: some View {
        GroupBox {
            Toggle("sort", isOn: $sortOrder)

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

#Preview {
    ContentView()
}
