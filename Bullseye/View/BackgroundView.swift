
import SwiftUI

struct BackgroundView: View {
  
  @Binding var game: Game
  @Binding var sliderValue: Double
  
  var body: some View {
    VStack {
      TopView(game: $game, sliderValue: $sliderValue)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(
      RingsView(ringsCount: 5)
    )
  }
}


struct TopView: View {
  @Binding var game: Game
  @Binding var sliderValue: Double
  @State private var leaderboardIsShowing = false
  
  var body: some View {
    HStack {
      Button(action: {
        withAnimation {
          game.reset()
          sliderValue = 50.0          
        }
      }) {
        CircleImageStroked(systemName: "arrow.counterclockwise")
      }
      Spacer()
      Button(action: {
        withAnimation {
          leaderboardIsShowing = true
        }
      }) {
        CircleImageFilled(systemName: "list.dash")
      }
      .sheet(isPresented: $leaderboardIsShowing, onDismiss: {}) {
        LeaderboardView(leaderboardIsShowing: $leaderboardIsShowing, game: $game)
      }
    }
  }
}

struct BottomView: View {
  @Binding var game: Game
  
  var body: some View {
    HStack {
      StatsView(title: "Score", value: String(game.score))
      Spacer()
      StatsView(title: "Round", value: String(game.round))
    }
  }
}

struct RingsView: View {
  let ringsCount: Int
  @Environment(\.colorScheme) var displayMode
  
  var body: some View {
    ZStack {
      Constants.Colors.background
        .edgesIgnoringSafeArea(.all)
      ForEach(1 ..< ringsCount + 1, id: \.self) { ring in
        let size = CGFloat(ring * 100)
        let opacity = displayMode == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20.0)
          .fill(
            RadialGradient(gradient: Gradient(colors: [Constants.Colors.rings.opacity(opacity), Constants.Colors.rings.opacity(0)]), center: .center, startRadius: 100, endRadius: 300))
          .frame(width: size, height: size)
      }
    }
  }
}

struct StatsView: View {
  let title: String
  let value: String
  var body: some View {
    VStack {
      StatsTitleText(text: title)
      StatsValueText(text: value)
        .overlay(
          RoundedRectangle(cornerRadius: Constants.General.rectCornerRadius)
            .strokeBorder(lineWidth: Constants.General.strokeWidth)
            .foregroundColor(Constants.Colors.roundButtonStroke)
          
        )
    }
  }
}


struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    
    
    BackgroundView(game: .constant(Game()), sliderValue: .constant(50.0))
    
    BackgroundView(game: .constant(Game()), sliderValue: .constant(50.0))
      .preferredColorScheme(.dark)

  }
}




