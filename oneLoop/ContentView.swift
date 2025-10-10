import SwiftUI

struct ContentView: View {
    @State private var isButtonPressed = false
    @State private var logoAppear = false
    

    var body: some View {
        VStack {
            Spacer()
            
            // MARK: - Logo with Animation
            HStack(spacing: 8) {
                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .scaleEffect(logoAppear ? 1.0 : 0.5)
                    .opacity(logoAppear ? 1.0 : 0.0)
                    .animation(.spring(response: 1.2, dampingFraction: 0.5), value: logoAppear)
                    .onAppear {
                        logoAppear = true
                    }
            }
            // MARK: - Text Under The Logo"
            Text("One Loop")
                .font(.custom("Avenir Next", size: 48))
                .fontWeight(.bold)
                .foregroundColor(.black)
            
            Text("One Loop, a Loop of Adventures.")
                .font(.custom("Avenir Next", size: 16))
                .foregroundColor(.gray)
            
            Spacer()
            
            // MARK: - Haptics of the Button
            Button(action: {
                let generator = UIImpactFeedbackGenerator(style: .medium)
                generator.impactOccurred()
                
                withAnimation(.spring(response: 0.3, dampingFraction: 0.5)) {
                    isButtonPressed.toggle()
                }
                // MARK: - Button Begin Adventure with sf symbols
            }) {
                HStack {
                    Image(systemName: "laurel.leading")
                        .foregroundColor(.white)
                        .symbolEffect(.wiggle)
                    Text("Begin Adventure")
                        .animation(.spring(response: 1.2, dampingFraction: 0.5), value: logoAppear)
                        .fontWeight(.bold)
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.white)
                    Image(systemName: "laurel.trailing")
                        .foregroundColor(.white)
                        .symbolEffect(.wiggle)
                }
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.black)
                .cornerRadius(14)
                .scaleEffect(isButtonPressed ? 1.05 : 1.0)
            }
            .buttonStyle(.plain)
            .padding(.horizontal, 48)
            .padding(.bottom, 60)
        }
        .background(Color.white)
        .ignoresSafeArea()
    }
}

// MARK: - For Canvas
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
