//
//  MultiFireworkView.swift
//  ConfettiSwiftUIDemo
//
//  Created by Simon Bachmann on 28.11.20.
//

import SwiftUI
import ConfettiSwiftUI

struct MultiFireworkView: View{
    @State var counter1 = 1
    @State var counter2 = 1
    @State var counter3 = 1
    @State var counter4 = 1
    @State var counter5 = 1
    
    var body: some View{
        ZStack{
            Text("🎇").font(.system(size: 50)).onTapGesture(){
                counter1 += 1
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    counter4 += 1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                    counter2 += 1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                    counter3 += 1
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.2) {
                    counter5 += 1
                }
            }
            ConfettiCannon(trigger: $counter5, num: 80, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 300)

            VStack{
                HStack{
                    ConfettiCannon(trigger: $counter1, num: 20, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                    Spacer()
                    ConfettiCannon(trigger: $counter2, num: 20, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                }
                Spacer()
                HStack{
                    ConfettiCannon(trigger: $counter3, num: 20, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                    Spacer()
                    ConfettiCannon(trigger: $counter4, num: 20, openingAngle: Angle(degrees: 0), closingAngle: Angle(degrees: 360), radius: 200)
                }
                
                
            }.frame(width: 200, height: 200, alignment: .center)
            

        }
    }
}


struct MultiFireworkView_Previews: PreviewProvider {
    static var previews: some View {
        MultiFireworkView()
    }
}
