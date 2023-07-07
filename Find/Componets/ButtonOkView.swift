//
//  ButtonOkView.swift
//  Find
//
//  Created by Lucas Pontes on 22/06/23.
//

import SwiftUI

struct ButtonOkView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 50)
                .foregroundColor(.green)
                .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
            Text("Confirmar")
                .foregroundColor(.black)
        }
    }
}

struct ButtonOkView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonOkView()
    }
}
