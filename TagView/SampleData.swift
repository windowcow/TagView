//
//  DDay.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI
import SwiftDate

struct SampleData: Hashable {
    var id: String = UUID().uuidString
    var value: String = (1 ... 15).randomElement()!.randomString
}

let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

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

