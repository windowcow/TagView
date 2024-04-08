//
//  DDay.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI

struct DDay: Taggable {
    var title: String
    var layoutValue: Date
    
    @ViewBuilder var label: some View {
        Text(title)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .foregroundStyle(.white)
            .background(.blue, in: .capsule(style: .circular))
            .layoutValue(key: Self.layoutValueKey, value: layoutValue)

    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(title)
        hasher.combine(layoutValue)
    }
    
    static let layoutValueKey = DDayLayoutValueKey.self

    struct DDayLayoutValueKey: LayoutValueKey {
        static var defaultValue: Date = .now
    }
    
    static func < (lhs: DDay, rhs: DDay) -> Bool {
        return lhs.layoutValue < rhs.layoutValue
    }

    static func == (lhs: DDay, rhs: DDay) -> Bool {
        return lhs.layoutValue == rhs.layoutValue
    }
}

extension DDay {
    static let samples: [DDay] = [
        DDay(title: "Quit Smoking", layoutValue: Date(timeIntervalSinceNow: 1)),
        DDay(title: "Test", layoutValue: Date(timeIntervalSinceNow: 2)),
        DDay(title: "Midterm Presentation", layoutValue: Date(timeIntervalSinceNow: 3))
    ]
}

