//
//  Colors+Extensions.swift
//  JGig-SwiftUI
//
//  Created by Joacim Nidén on 2020-04-29.
//  Copyright © 2020 Joacim Nidén. All rights reserved.
//

import SwiftUI

extension Color {
  static var subTitle: Color {
    return Color(red: 0.922, green: 0.922, blue: 0.961).opacity(0.6)
  }
  
  static var defaultBackgroundColor: Color {
    return Color(red: 0.173, green: 0.173, blue: 0.235)
  }
  
  static var secondaryBackground: Color {
    return Color(red: 28/255, green: 28/255, blue: 30/255)
  }
  
  static var gigRed: Color {
    return Color(red: 1, green: 0.271, blue: 0.227)
  }
  
  static var gigBlue: Color {
    return Color(red: 0.039, green: 0.518, blue: 1)
  }
  
  static var gigGreen: Color {
    return Color(red: 0.196, green: 0.843, blue: 0.294)
  }
  
  static var gigPurple: Color {
    return Color(red: 0.369, green: 0.361, blue: 0.902)
  }
  
  static var gigPink: Color {
    return Color(red: 0.749, green: 0.353, blue: 0.949)
  }
  
  static var gigYellow: Color {
    return Color(red: 1, green: 0.624, blue: 0.039)
  }
}
