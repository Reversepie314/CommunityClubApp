 


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
                    Text("Community Club")
                        .font(.system(size: 50, weight: .medium, design: .rounded))//.background(Color.green)                        /*.font(.largeTitle)*/
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

 

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#Preview {
    ContentView()
}


// This session is title
