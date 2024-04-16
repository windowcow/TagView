////
////  Practice.swift
////  TagViewSampleApp
////
////  Created by windowcow on 4/15/24.
////
//
//import SwiftUI
//
//struct Practice: View {
//    @State private var samples = SampleData.samples
//    @State private var changeSort = true
//    
//    var body: some View {
//        VStack {
//            VStack {
//                ForEach(samples, id: \.self) { data in
//                    data.label
//                }
//            }
//            
//            
//            Toggle(isOn: $changeSort, label: {
//                Text("Label")
//            })
//            
//        }
//        .onChange(of: changeSort) {  newValue in
//            if newValue {
//                samples = samples.sorted { d1, d2 in
//                    d1.count < d2.count
//                }
//            } else {
//                samples.sort { d1, d2 in
//                    d1.value < d2.value
//                }
//            }
//            
//        }
//        .animation(.spring, value: changeSort)
//        
//    }
//}
//
//#Preview {
//    Practice()
//}
