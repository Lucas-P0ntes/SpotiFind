//
//  TituloView.swift
//  Find
//
//  Created by Lucas Pontes on 22/06/23.
//

import SwiftUI

struct Titulo: View {
    let title: String
    var body: some View {
        
        Text(title)
            .foregroundColor(.black)
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .transition(.slide)
    }
}

struct SubTitulo: View {
    let title: String
    var body: some View {
        
        Text(title)
            .foregroundColor(.black)
            .font(.system(size: 22, weight: .bold, design: .rounded))
            .transition(.slide)
    }
}

struct TituloView_Previews: PreviewProvider {
    static var previews: some View {
        Titulo(title: "LUCAS")
    }
}

