//
//  DDay.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI

struct SampleData: Hashable {
    var id: String = UUID().uuidString
    var value: String = (1 ... 15).randomElement()!.randomString
    var count: String {
        value.count.description
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(value)
    }
}

let letters = "abcdefghijklmnopqrstuvwxyz"

extension Int {
    var randomString: String {
        return String((0..<self).map{ _ in letters.randomElement()! })
    }
}


extension SampleData {
    static let samples: [SampleData] = [
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData(),
        SampleData()
    ]
    
    var label: some View {
        Text(value.description)
            .padding(.horizontal)
            .padding(.vertical, 5)
            .foregroundStyle(.white)
            .background(.blue, in: .capsule(style: .circular))
    }
    
}

