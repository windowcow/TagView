//
//  TagView.swift
//  TagView
//
//  Created by windowcow on 7/15/23.
//

import SwiftUI

extension CGPoint {
    static func +(lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}

//@resultBuilder
//struct TagBuilder<V: Hashable & View> {
//    private var tagViewOrigin: CGPoint = CGPoint()
//    private var nextOrigin: CGPoint = CGPoint(x: 0, y: 0)
//    @MainActor
//    static func buildBlock(_ components: V..., tagViewOrigin: inout CGPoint, nextOrigin: inout CGPoint) -> some View {
//        GeometryReader { geo1 in
//            tagViewOrigin = geo1.frame(in: .global).origin
//            ForEach(components, id: \.self) { component in
//                GeometryReader { geo2 in
//                    component.position(/*@START_MENU_TOKEN@*/CGPoint(x: 10.0, y: 10.0)/*@END_MENU_TOKEN@*/)
//                    nextOrigin = nextOrigin + geo2.frame(in: .local).origin
//                }
//            }
//        }
//    }
//}


//#Preview {
////    TagView()
//}


//struct TagBuilder<T: Taggable> {
//    enum AlignmentType {
//        case Horizontal, Vertical
//    }
//    
//    @State var alignment: AlignmentType
//    @ViewBuilder var viewBuilder: some View {
//        switch alignment {
//        case .Horizontal:
//            HStack {
//                
//            }
//        case .Vertical:
//            VStack {
//                
//            }
//        }
//    }
//    init(tagViews: T..., alignment: AlignmentType = .Horizontal) {
//        
//    }
//}

struct TagView: View {
    @State var binding: CGRect = CGRect()
    @State var str: String = "123123"
    var body: some View {
        VStack {
            TextField("", text: $str)
                .background(.yellow)
            ViewThatFits {
                Text(str)
                    .getFrame($binding)
            }
            Button {
                print(binding)
            } label: {
                Text("btn")
            }
            
            Text("\(binding.origin.y) and \(binding.size.width)")
                .background(.gray)
            }
    }
}


extension View {
    @MainActor
    func getFrame(_ binding: Binding<CGRect>) -> some View {
        view
        GeometryReader { geo in
            DispatchQueue.main.async {
                binding.wrappedValue = geo.frame(in: .local)
            }
            return Color.clear
        }.frame(width: 0, height: 0)
        return self
        
//        return self
    }
}
