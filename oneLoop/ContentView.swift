import SwiftUI

struct ContentView: View {
    @State private var logoAppear = false
    @State private var buttonAppear = false

    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .gray.opacity(0.05)],
                           startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()

            VStack {
                Spacer()

                Image("Logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 140)
                    .opacity(logoAppear ? 1 : 0)
                    .scaleEffect(logoAppear ? 1 : 0.8)
                    .shadow(color: .black.opacity(0.1), radius: 10, y: 5)
                    .animation(.spring(response: 1.0, dampingFraction: 0.7).delay(0.2), value: logoAppear)

                Spacer()

                Button(action: {}) {
                    Text("Begin Adventure")
                        .font(.system(.headline, design: .rounded))
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(14)
                        .shadow(radius: 6, y: 3)
                        .padding(.horizontal, 48)
                        .padding(.bottom, 30)
                }
                .opacity(buttonAppear ? 1 : 0)
                .offset(y: buttonAppear ? 0 : 60)
                .animation(.interpolatingSpring(stiffness: 180, damping: 16).delay(0.6), value: buttonAppear)
            }
        }
        .onAppear {
            logoAppear = true
            buttonAppear = true
        }
    }
}

#Preview {
    ContentView()
}
