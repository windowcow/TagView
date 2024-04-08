//
//  DDay.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI
import SwiftDate

struct DDay: Taggable {
    var title: String
    var date: Date = .now
    
    var layoutOrder: Date {
        get {
            date
        }
    }
    
    var formattedDate: String {
        let dateComponents = date - Date.now
        return dateComponents.timeInterval.toString {
            $0.unitsStyle = .abbreviated
            $0.allowedUnits = [.day, .hour]
        }
    }
    
    
    @ViewBuilder var label: some View {
        Text(formattedDate)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .foregroundStyle(.white)
            .background(.blue, in: .capsule(style: .circular))
            .layoutValue(key: Self.layoutValueKey, value: layoutOrder)

    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(layoutOrder)
    }
    
    static let layoutValueKey = DDayLayoutValueKey.self

    struct DDayLayoutValueKey: LayoutValueKey {
        static var defaultValue: Date = .now
    }
}

extension DDay {
    static let samples: [DDay] = [
        DDay(title: "Quit Smoking", date: .now.addingTimeInterval(Double((10000..<100000).randomElement()!))),
        DDay(title: "Quit Smoking", date: .now.addingTimeInterval(Double((10000..<100000).randomElement()!))),
        DDay(title: "Quit Smoking", date: .now.addingTimeInterval(Double((10000..<100000).randomElement()!))),
        DDay(title: "Quit Smoking", date: .now.addingTimeInterval(Double((10000..<100000).randomElement()!))),
        DDay(title: "Quit Smoking", date: .now.addingTimeInterval(Double((10000..<100000).randomElement()!))),
    ]
}

