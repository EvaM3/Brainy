//
//  PrimaryButton.swift
//  TriviaGame
//
//  Created by Eva Sira Madarasz on 15/09/2023.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    var background: Color = Color("AccentColor")
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(background)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}
