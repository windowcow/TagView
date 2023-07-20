//
//  ContentView.swift
//  TagView
//
//  Created by windowcow on 7/15/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        makeView {
            MyView(text: "111")
            MyView(text: "122")
            MyView(text: "133")
        }
    }
}

struct MyView: View {
    @State var text: String
    var body: some View {
        Text(text)

    }
}
