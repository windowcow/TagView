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
    
    var title: String { get set }
    var layoutValue: LayoutValue { get set }
    static var layoutValueKey: StaticLayoutValueKey.Type { get }
}
