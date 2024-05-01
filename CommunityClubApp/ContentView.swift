 


import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Image("TitleScreenImage")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Spacer()
                    ZStack {
                        
                        
                        
                        
                        Rectangle()
                            .fill(Color.black) // Set the background color for the square
                            .frame(width: 375, height: 325)
                            .opacity(0.8)//
                        
                        
                        
                      //  Spacer()
                        Text("Community Club")
                            .font(.system(size: 50, weight: .medium, design: .rounded))
                    }
                
                    
                    
                    
                    //.background(Color.green)                        /*.font(.largeTitle)*/
                            .foregroundColor(.white)
                            .padding()
                    
                    NavigationLink(destination: SearchPage()) {
                        Text("Get Started")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    
                    Spacer() // Pushes content to the center
                }
            }
        }
        
    }
}

 

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
#Preview {
    ContentView()
}


// This session is title
