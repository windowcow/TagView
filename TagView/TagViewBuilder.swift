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

class PointReference {
    var point: CGPoint

    init(_ point: CGPoint) {
        self.point = point
    }
}

class FloatReference {
    var float: CGFloat

    init(_ float: CGFloat) {
        self.float = float
    }
}


@resultBuilder
struct TagViewBuilder {
    
    
    @MainActor
    static func buildBlock<V: View>(_ components: V...) -> some View {
        @State var rect: CGRect = CGRect()
        var n: CGFloat = 0
        var views: [AnyView] = []
        
        for component in components {
            n += 50
            let view2 = AnyView(component.position(x: n, y: n))
            views.append(view2)
        }
        return ZStack {
            ForEach(views, id: \.id) { view in
                view
                Text("123")
            }
        }
        .getFrameRect(rect: $rect, in: .global)
    }
    
}

func makeView(@TagViewBuilder content: () -> some View ) -> some View {
    VStack {
        content()
    }
}


extension View {
    var id: UUID {
        UUID()
    }
    
    @MainActor
    func getFrameRect(rect: Binding<CGRect>, in coordinateSpace: CoordinateSpace) -> some View {
        ZStack {
            self
            GeometryReader { geo in
                self
                    .task {
                        rect.wrappedValue = geo.frame(in: coordinateSpace)
                    }
            }
            
        }
        .fixedSize()
        

    }
}

#Preview {
    ContentView()
}
