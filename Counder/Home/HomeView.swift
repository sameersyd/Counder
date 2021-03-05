//
//  HomeView.swift
//  Counder
//
//  Created by Sameer Nawaz on 05/03/21.
//

import SwiftUI

struct HomeView: View {
    
    let appWidth = UIScreen.main.bounds.width
    let appHeight = UIScreen.main.bounds.height
    
    @State var progress = Double(0)
    
    var body: some View {
        ZStack {
            Color.primary_color.edgesIgnoringSafeArea(.all)
            BubbleView(size: 200, x: 70 - appWidth/2, y: appHeight/2 - 70)
            BubbleView(size: 150, x: 10 - appWidth/2, y: appHeight/2 - 170)
            BubbleView(size: 200, x: appWidth/2 - 40, y: 120 - appHeight/2)
            BubbleView(size: 100, x: appWidth/2 - 40, y: 10 - appHeight/2)
            VStack {
                HStack {
                    Text("COUNDER").modifier(MontserratFont(.extra_bold, size: 32))
                        .foregroundColor(Color.text_primary_color)
                    Spacer()
                }.padding(.top, 16).padding(.leading, 23)
                Spacer()
            }
            TimerView(progress: $progress)
                .onAppear() {
                    Timer.scheduledTimer(withTimeInterval: 0.25, repeats: true) { _ in progress = progress > 100 ? 0 : progress + 5 }
                }
        }
    }
}

struct TimerView: View {
    @Binding var progress: Double
    let gradientColors = [Color(hex: "C71FD6"), Color(hex: "DC8219"), Color(hex: "172EAA"), Color(hex: "E93D3D")]
    var body: some View {
        ZStack {
            BubbleView(size: 270, x: 0, y: 0)
            Circle()
                .foregroundColor(Color.main_color).frame(width: 200, height: 200)
            Image(systemName: "arrowtriangle.right.fill")
                .resizable().frame(width: 54, height: 60)
                .foregroundColor(Color.white).offset(x: 5, y: 0)
            Circle()
                .trim(from: 0, to: CGFloat(progress) / 100)
                .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .butt, dash: [2, 15]))
                .fill(LinearGradient(gradient: .init(colors: gradientColors),
                                     startPoint: .topLeading, endPoint: .trailing))
                .animation(.spring()).frame(width: 325, height: 325)
        }
    }
}

struct BubbleView: View {
    let size: CGFloat, x: CGFloat, y: CGFloat
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(Color.bubble_color)
                .frame(width: size, height: size).offset(x: x, y: y)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
