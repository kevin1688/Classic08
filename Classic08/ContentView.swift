//
//  ContentView.swift
//  Classic08
//
//  Created by kai wen chen on 2021/10/15.
//

import SwiftUI
struct ContentView: View {
    
    var body: some View {
        Button {
            let db = DataModel()
            db.listenData()
        } label: {
            Text("test")
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
