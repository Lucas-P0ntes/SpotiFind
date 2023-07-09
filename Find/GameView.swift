import SwiftUI

struct GameView: View {
    @EnvironmentObject var api: API
    @State var searchText = ""
    @State var score = 0
    @State var isActive = false
    @State var isActives = false
    @State var isActivess = false


    
    var body: some View {
        ZStack {
            BallView()
            VStack {
                ZStack{
                    VStack {
                        HStack {
                            Titulo(title: "SpoatiFind")
                            Spacer()
                            SubTitulo(title: "Score: \(score)")
                        }
                        .padding()
                        
                        GeneratorView().environmentObject(api)
                        TextFieldView(searchText: $searchText)
                        
                        Spacer()
                    }
                    PopRightView(isShowing: $isActive)
                   PopWorngView(isShowing: $isActives)
                PopAlertView(isShowing: $isActivess)
                    
                }
                Button(action: {
                    onSearchButtonTapped()
                }
                ){
                    ButtonOkView()
                }
                
                Button(action: {
                    onNextButtonTapped()
                }) {
                    ButtonNextView()
                }
            }
            .padding()
        }.task {
            do {
                try await api.buscar()
            } catch {
                print("Error", error)
            }
            
        }
        
    }
 
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(API())
    }
}
