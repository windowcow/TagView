//
//  Taggable.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI

protocol Taggable: Hashable, Comparable {
    associatedtype LayoutValue: Comparable, Hashable
    associatedtype StaticLayoutValueKey: LayoutValueKey where StaticLayoutValueKey.Value == LayoutValue
    associatedtype Content: View
    
    var title: String { get set }
    var layoutValue: LayoutValue { get set }
    
    @ViewBuilder var label: Content { get }
    static var layoutValueKey: StaticLayoutValueKey.Type { get }
}
