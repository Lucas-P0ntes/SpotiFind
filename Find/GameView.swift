import SwiftUI

struct GameView: View {
    @EnvironmentObject var api: API
    @State var searchText = ""
    @State var score = 0
    
    var body: some View {
        ZStack {
            BallView()
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
            
        }
        
    }
    
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView().environmentObject(API())
    }
}
