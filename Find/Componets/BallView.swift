//
//  BallView.swift
//  Find
//
//  Created by Lucas Pontes on 22/06/23.
//

import SwiftUI

struct BallView: View {
    var body: some View {
        VStack{
            Circle()
                .frame(width: 290)
                .foregroundColor(.green)
                .offset(x: -100, y: -100)
                .opacity(10)
            Spacer()
            Circle()
                .frame(width: 290)
                .foregroundColor(.green)
                .offset(x: 150, y: 00)
            Spacer()
        }
    }
}

struct BallView_Previews: PreviewProvider {
    static var previews: some View {
        BallView()
    }
}
