//
//  ContentView.swift
//  ConfettiSwiftUIDemo
//
//  Created by Simon Bachmann on 26.11.20.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ZStack{
                ExampleTab()
            }
            .tabItem{
                Image(systemName: "eye")
                Text("Examples")
            }
            
            ZStack{
                ConfiguratorTab()
            }
            .tabItem{
                Image(systemName: "hammer")
                Text("Configurator")
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
