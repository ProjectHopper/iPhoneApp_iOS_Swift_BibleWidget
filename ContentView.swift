import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = BibleViewModel()
    
    var body: some View {
        ZStack {
            // Background
            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 20) {
                if let verse = viewModel.todayVerse {
                    VStack(spacing: 12) {
                        Text(verse.content_kr)
                            .font(.system(size: 22, weight: .bold, design: .serif))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.primary)
                            .padding(.horizontal)
                        
                        Text(verse.content_en)
                            .font(.system(size: 18, weight: .regular, design: .serif))
                            .multilineTextAlignment(.center)
                            .foregroundColor(.secondary)
                            .padding(.horizontal)
                        
                        Text(verse.reference)
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.top, 8)
                    }
                    .padding()
                    .background(Color.white.opacity(0.6))
                    .cornerRadius(16)
                    .shadow(radius: 5)
                    
                    ShareLink(item: "\(verse.content_kr)\n\(verse.content_en)\n- \(verse.reference)") {
                        Label("Share Verse", systemImage: "square.and.arrow.up")
                    }
                    .padding(.top, 20)
                } else {
                    Text("Loading...")
                }
            }
            .padding()
        }
    }
}
