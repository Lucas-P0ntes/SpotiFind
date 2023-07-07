//
//  TextFieldView.swift
//  Find
//
//  Created by Lucas Pontes on 22/06/23.
//

import SwiftUI

struct TextFieldView: View {
    @Binding var searchText:String
    var body: some View {
        TextField("Qual é o artista:", text: $searchText)
            .frame(width: 325, height: 15)
            .padding()
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .background(Color.gray.opacity(0.5))
            .cornerRadius(5)
            .foregroundColor(.black)
            .transition(.move(edge: .trailing))
        
    }
}

//struct TextFieldView_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldView(searchText: <#Binding<String>#>)
//    }
//}
