//
//  TimerPickerView.swift
//  Counder
//
//  Created by Sameer Nawaz on 05/03/21.
//

import SwiftUI

struct TimerPickerView: View {
    
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    Spacer()
                    Button(action: { viewModel.dismissPickerSheet() }, label: {
                                Image(systemName: "xmark")
                                    .resizable().frame(width: 12, height: 12)
                                    .font(Font.title.weight(.bold))
                           })
                        .frame(width: 32, height: 32).foregroundColor(Color.white)
                        .background(Color(hex: "ffffff", alpha: 0.5)).cornerRadius(25)
                }.padding(.top, 10)
                Button(action: { viewModel.startTimerButt() },
                       label: { Image(systemName: "arrowtriangle.right.fill").resizable().frame(width: 14, height: 18) })
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.white)
                    .background(Color.main_color).cornerRadius(25)
                    .padding(.bottom, 30)
            }
            .padding(16).frame(maxWidth: .infinity)
            .background(Color.secondary_color)
            .cornerRadius(32)
        }.edgesIgnoringSafeArea(.all)
    }
}

//struct TimerPickerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerPickerView()
//    }
//}
