//
//  ConfiguratorTab.swift
//  ConfettiSwiftUIDemo
//
//  Created by Simon Bachmann on 28.11.20.
//

import SwiftUI
import ConfettiSwiftUI

struct ConfiguratorTab: View{
    @State var num:Int = 20
    @State var confettis:[ConfettiType] = ConfettiType.allCases
    @State var colors:[Color] = [.blue, .red, .green, .yellow, .pink, .purple, .orange]
    @State var confettiSize:CGFloat = 10.0
    @State var rainHeight: CGFloat = 600.0
    @State var fadesOut:Bool = true
    @State var opacity:Double = 1.0
    @State var openingAngle:Double = 60
    @State var closingAngle:Double = 120
    @State var radius:CGFloat = 300
    @State var repetitions:Int = 0
    @State var repetitionInterval:Double = 1.0
    
    @State var showSheet = false
        
    var body: some View{
        NavigationView{
            Form{
                Section(header: Text("Confetti")) {
                    NavigationLink(destination: ConfettiSelectionView(confettis: $confettis)) {
                        Text("Select Shapes: \(confettis.count)")
                    }
                    NavigationLink(destination: ColorSelectionView(colors: $colors)) {
                        Text("Select Colors: \(colors.count)")
                    }
                    Stepper("Confettis: \(num)", value: $num, in: 1...100, step: 5)
                    Stepper("Size: \(String(format: "%.2f", confettiSize))", value: $confettiSize, in: 1...50, step: 1)
                    Stepper("Rain Height: \(String(format: "%.0f", rainHeight))", value: $rainHeight, in: 0...1000, step: 50)
                    Stepper("Opacity: \(String(format: "%.2f", opacity))", value: $opacity, in: 0...1, step: 0.1)
                }
                
                Section(header: Text("Animation")){
                    Toggle(isOn: $fadesOut) { Text("Fades out") }
                    Stepper("Opening Angle: \(String(format: "%.2f", openingAngle))", value: $openingAngle, in: 0...360, step: 10)
                    Stepper("Closing Angle: \(String(format: "%.2f", closingAngle))", value: $closingAngle, in: 0...360, step: 10)
                    Stepper("Radius: \(String(format: "%.2f", radius))", value: $radius, in: 1...1000, step: 20)
                    Stepper("Repetitions: \(repetitions)", value: $repetitions, in: 1...100, step: 1)
                    Stepper("Repetition Intervall: \(String(format: "%.2f", repetitionInterval))", value: $repetitionInterval, in: 0.1...10, step: 0.1)
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Label("Preview", systemImage:"eye").onTapGesture {
                        showSheet.toggle()
                    }
                }
            }
            .sheet(isPresented: $showSheet){
                ConfiguratorPreview(num: num, confettis: confettis, colors: colors, confettiSize: confettiSize, rainHeight: rainHeight, fadesOut: fadesOut, opacity: opacity, openingAngle: .degrees(openingAngle), closingAngle: .degrees(closingAngle), radius: radius, repetitions: repetitions, repetitionInterval: repetitionInterval)
            }
            .navigationTitle("Cofigurator")
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ColorSelectionView:View{
    @Binding var colors:[Color]
    @State private var selectedColor = Color.yellow
    @State private var showColorPicker = false
    
    var body: some View{
        Form{
            Section(header: Text("Add new color")){
                ColorPicker("Select a color", selection: $selectedColor)
                Button("Add selected color"){colors.append(selectedColor)}
            }
            Section(header: Text("Selected colors")){
                List{
                    ForEach(0..<colors.count, id:\.self){i in
                        colors[i].clipShape(Circle())
                    }
                    .onDelete(perform: delete)
                }
            }
        }
        .navigationTitle("Colors")
    }
    
    func delete(at offsets: IndexSet) {
        colors.remove(atOffsets: offsets)
    }
}

struct ConfettiSelectionView:View{
    @Binding var confettis:[ConfettiType]
    
    var body: some View{
        Form{
            List{
                ForEach(ConfettiType.allCases, id:\.self){type in
                    MultipleSelectionRow(type: type, isSelected: confettis.contains(type)){
                        if confettis.contains(type) && confettis.count > 1 {
                            confettis.removeAll(where: { $0 == type })
                        }
                        else if !confettis.contains(type){
                            confettis.append(type)
                        }
                    }
                }
            }
        }
        .navigationTitle("Confetti Shapes")
    }
}


struct MultipleSelectionRow: View {
    var type: ConfettiType
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        Button(action: self.action) {
            HStack {
                type.view.frame(width: 30, height: 30)
                if self.isSelected {
                    Spacer()
                    Image(systemName: "checkmark")
                }
            }
        }
    }
}

struct ConfiguratorPreview: View{
    @State var counter = 1
    
    let num:Int
    let confettis:[ConfettiType]
    let colors:[Color]
    let confettiSize:CGFloat
    let rainHeight:CGFloat
    let fadesOut:Bool
    let opacity:Double
    let openingAngle:Angle
    let closingAngle:Angle
    let radius:CGFloat
    let repetitions:Int
    let repetitionInterval:Double

    var body: some View{
        ZStack{
            ConfettiCannon(
                trigger: $counter,
                num: num,
                confettis: confettis,
                colors: colors,
                confettiSize: confettiSize,
                rainHeight: rainHeight,
                fadesOut: fadesOut,
                opacity: opacity,
                openingAngle: openingAngle,
                closingAngle: closingAngle,
                radius: radius,
                repetitions: repetitions,
                repetitionInterval: repetitionInterval)
            Button("Trigger Animation"){counter += 1}
        }
    }
}

struct ConfiguratorTab_Previews: PreviewProvider {
    static var previews: some View {
        ConfiguratorTab()
    }
}
