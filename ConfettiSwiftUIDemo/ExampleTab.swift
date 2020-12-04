//
//  ExampleTab.swift
//  ConfettiSwiftUIDemo
//
//  Created by Simon Bachmann on 28.11.20.
//

import SwiftUI
import ConfettiSwiftUI

struct ExampleTab: View{
    @State var counter1:Int = 0
    @State var counter2:Int = 0
    @State var counter3:Int = 0
    @State var counter4:Int = 0
    @State var counter5:Int = 0
    @State var counter6:Int = 0
    @State var counter7:Int = 0
    
    var body: some View{
        NavigationView{
            Form{
                NavigationLink(destination: ZStack{
                    Text("🎉").font(.system(size: 50)).onTapGesture(){counter1 += 1}
                    ConfettiCannon(counter: $counter1)
                }){
                    Label("Default", systemImage:"eye")
                }
                
                
                NavigationLink(destination: ZStack{
                    Text("🎊").font(.system(size: 50)).onTapGesture(){counter2 += 1}
                    ConfettiCannon(counter: $counter2, colors: [.red, .black], confettiSize: 20)
                }){
                    Label("Colors", systemImage:"eyedropper")
                }
                
                NavigationLink(destination: ZStack{
                    Text("🔁").font(.system(size: 50)).onTapGesture(){counter3 += 1}
                    ConfettiCannon(counter: $counter3, repetitions: 3, repetitionInterval: 0.7)
                }){
                    Label("Repeat", systemImage:"repeat")
                }
                
                
                NavigationLink(destination: ZStack{
                    Text("🧨").font(.system(size: 50)).onTapGesture(){counter4 += 1}
                    ConfettiCannon(counter: $counter4, num: 50, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                }){
                    Label("Firework", systemImage:"flame")
                }
                
                NavigationLink(destination: ZStack{
                    Text("❤️").font(.system(size: 50)).onTapGesture(){counter5 += 1}
                    ConfettiCannon(counter: $counter5, confettis: [.text("❤️"), .text("💙"), .text("💚"), .text("🧡")])
                }){
                    Label("Emoji", systemImage:"suit.heart")
                }
                
                NavigationLink(destination: ZStack{
                    Text("💩").font(.system(size: 50)).onTapGesture(){counter6 += 1}
                    ConfettiCannon(counter: $counter6, num:1, confettis: [.text("💩")], confettiSize: 20, repetitions: 100, repetitionInterval: 0.1)
                }){
                    Label("Continues", systemImage:"umbrella")
                }
                
                NavigationLink(destination: ZStack{
                    Text("💰").font(.system(size: 50)).onTapGesture(){counter7 += 1}
                    ConfettiCannon(counter: $counter7, num:1, confettis: [.text("💵"), .text("💶"), .text("💷"), .text("💴")], confettiSize: 30, repetitions: 50, repetitionInterval: 0.1)
                }){
                    Label("Make it Rain", systemImage:"bitcoinsign.circle")
                }
                
                NavigationLink(destination: MultiFireworkView() ){
                    Label("Multiple", systemImage:"person.3")
                }
                
            }
            .navigationTitle("Examples")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ExampleTab_Previews: PreviewProvider {
    static var previews: some View {
        ExampleTab()
    }
}
