//
//  ColorExtension.swift
//  Counder
//
//  Created by Sameer Nawaz on 05/03/21.
//

import SwiftUI

extension Color {
    
    static let main_color = Color(UIColor(red: 17/255, green: 64/255, blue: 248/255, alpha: 1.0))
    static let primary_color = Color.black
    static let secondary_color = Color(UIColor(red: 33/255, green: 33/255, blue: 33/255, alpha: 1.0))
    static let bubble_color = Color(UIColor(red: 68/255, green: 68/255, blue: 68/255, alpha: 0.1))
    static let text_primary_color = Color.white
    
    init(hex: String, alpha: Double = 1) {
        var cString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (cString.hasPrefix("#")) { cString.remove(at: cString.startIndex) }
        
        let scanner = Scanner(string: cString)
        scanner.currentIndex = scanner.string.startIndex
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        self.init(.sRGB, red: Double(r) / 0xff, green: Double(g) / 0xff, blue:  Double(b) / 0xff, opacity: alpha)
    }
}
