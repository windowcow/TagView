//
//  Taggable.swift
//  TagView
//
//  Created by windowcow on 4/8/24.
//

import Foundation
import SwiftUI

protocol Taggable: Hashable {
    associatedtype LayoutValue: Comparable
    associatedtype CustomLayoutValueKey: LayoutValueKey where CustomLayoutValueKey.Value == LayoutValue
    associatedtype Content: View
    
    var layoutOrder: LayoutValue { get }
    
    var label: Content { get }
    
    static var layoutValueKey: CustomLayoutValueKey.Type { get }
}
