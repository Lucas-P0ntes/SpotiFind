//
//  ButtonNextView.swift
//  Find
//
//  Created by Lucas Pontes on 22/06/23.
//

import SwiftUI

struct ButtonNextView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 290, height: 45)
                .foregroundColor(.orange)
                .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
            Text("Proximo")
                .foregroundColor(.black)
        }
    }
}

struct ButtonNextView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonNextView()
    }
}
