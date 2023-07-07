//
//  GeneratorView.swift
//  Find
//
//  Created by Lucas Pontes on 01/07/23.
//

import SwiftUI

struct GeneratorView: View {
    @EnvironmentObject var api: API

    var body: some View {
        VStack {
            Spacer()
            ForEach(api.users, id: \.id) { user in
                if let imageUrl = user.images?.first?.url,
                   let url = URL(string: imageUrl) {
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .shadow(color: Color.gray, radius: 5, x: 0, y: 2)
                    } placeholder: {
                        Color.gray
                    }
                } else {
                    Color.gray
                }

                Text("Popularidade: \(user.popularity ?? 0)")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .bold, design: .rounded))

                Text("Followers: \(user.followers?.total ?? 0)")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .bold, design: .rounded))

                Text("Genres: \(user.genres?.joined(separator: ", ") ?? "Não encontrado")")
                    .foregroundColor(.black)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
            }
        }
    }
}

struct GeneratorView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratorView().environmentObject(API())
    }
}
