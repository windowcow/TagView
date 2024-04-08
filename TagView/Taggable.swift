//
//  Taggable.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI

protocol Taggable: Hashable {
    associatedtype LayoutValue: Comparable, Hashable
    associatedtype StaticLayoutValueKey: LayoutValueKey where StaticLayoutValueKey.Value == LayoutValue
    associatedtype Content: View
    
    var title: String { get set }
    var layoutOrder: LayoutValue { get }
    
    @ViewBuilder var label: Content { get }
    static var layoutValueKey: StaticLayoutValueKey.Type { get }
}
