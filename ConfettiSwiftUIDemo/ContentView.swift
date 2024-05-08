//
//  ContentView.swift
//  ConfettiSwiftUIDemo
//
//  Created by Simon Bachmann on 26.11.20.
//

import SwiftUI
import ConfettiSwiftUI

struct ContentView: View {
    @State var counter1:Int = 0
    @State var counter2:Int = 0
    @State var counter3:Int = 0
    @State var counter4:Int = 0
    @State var counter5:Int = 0
    @State var counter6:Int = 0
    @State var counter7:Int = 0
    @State var counter8:Int = 0


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
