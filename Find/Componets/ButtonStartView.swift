//
//  ButtonIView.swift
//  Find
//
//  Created by Lucas Pontes on 22/06/23.
//

import SwiftUI

struct ButtonStartView: View {
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 320, height: 60)
                .foregroundColor(.orange)
                .shadow(color: Color.blue, radius: 5, x: 0, y: 2)
            Text("Start")
                .foregroundColor(.black)
        }
    }
}

struct ButtonIView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonStartView()
    }
}
