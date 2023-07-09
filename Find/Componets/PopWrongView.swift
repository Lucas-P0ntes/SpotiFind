import SwiftUI

struct PopWorngView: View {
   @Binding  var isShowing:Bool
  //  @State var isShowing =  true
    @State private var scale = 1.0
    
    var body: some View {
        VStack {
            
            if isShowing {
                
                VStack {
                  
                    ZStack{
                        
                        Circle()
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.red)
                        Rectangle()
                            .frame(width: 10, height: 50)
                            .rotationEffect(.degrees(40))
                        Rectangle()
                            .frame(width: 10, height: 50)
                            .rotationEffect(.degrees(-40))
                        
                    }
                    ZStack{
                        RoundedRectangle(cornerRadius: 10)
                            .frame(width: 90, height: 40)
                            .foregroundColor(Color.white)
                        Titulo(title:"- 10 ")
                    }
                }
                    .scaleEffect(scale)
                    .animation(Animation.easeInOut(duration: 0.8).repeatCount(3, autoreverses: true), value: scale)
                    
                    
                    .onAppear {
                        withAnimation {
                          
                        }
                        scale = 2
                        
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            scale = 1
                            withAnimation {
                                isShowing = false
                            }
                            
                        }
                }
                }
                
                
            }
        }
         
        
    }



//struct Previews_PopWrongView_Previews: PreviewProvider {
//    static var previews: some View {
//        PopWorngView()
//    }
//}
