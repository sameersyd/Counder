//
//  MontserratFontModifier.swift
//  Counder
//
//  Created by Sameer Nawaz on 05/03/21.
//

import SwiftUI

enum MontserratFontType: String {
    case regular = "Montserrat-Regular"
    case bold = "Montserrat-Bold"
    case extra_bold = "Montserrat-ExtraBold"
}

struct MontserratFont: ViewModifier {
    
    var type: MontserratFontType
    var size: CGFloat
    
    init(_ type: MontserratFontType = .regular, size: CGFloat = 16) {
        self.type = type
        self.size = size
    }
    
    func body(content: Content) -> some View {
        content.font(Font.custom(type.rawValue, size: size))
    }
}
