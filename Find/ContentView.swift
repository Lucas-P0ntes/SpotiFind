import SwiftUI

struct ContentView: View {
    @EnvironmentObject var api: API

    var body: some View {
        NavigationStack {
            ZStack {
                BallView()
                VStack {
                    Titulo(title: "SpotiFind")
                    // Envolver o botão com um NavigationLink
                    NavigationLink(destination: GameView().navigationBarBackButtonHidden(true)){
                        ButtonStartView()
                    }
                }
                .padding()
            }
            
        }.task {
            do {
                try await api.buscar()
            } catch {
                print("Error", error)
            }
        }
      
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(API())
           
    }
}
