//
//  Extensions.swift
//  TriviaGame
//
//  Created by Eva Sira Madarasz on 15/09/2023.
//

import Foundation
import SwiftUI

extension Text {
func lilacTitle() -> some View {
    self.font(.title)
        .fontWeight(.heavy)
        .foregroundColor(Color("AccentColor"))
}
}
