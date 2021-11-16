//
//  ContentView.swift
//  ProgressViewExample
//
//  Created by Federico on 15/11/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var showLoading = false
    @State private var status = "Downloading..."
    @State private var data = 0.0
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Spacer()
            if showLoading {
                ProgressView("Loading")
            } else {
                ProgressView("\(status)", value: data, total: 100)
                    .onReceive(timer) { _ in
                        if data < 100 {
                            data += Double.random(in: 0...4)
                        } else {
                            status = "Done!"
                        }
                        
                    }
            }
            Spacer()
            Toggle("Infinite", isOn: $showLoading.animation())
     
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
