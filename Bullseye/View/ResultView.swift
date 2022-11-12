
import SwiftUI

struct ResultView: View {
  
  @Binding var sliderValue: Double
  @Binding var game: Game
  @Binding var alertIsVisible: Bool
  
  var body: some View {
    let roundedSlider = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedSlider)
    
    VStack(spacing: 10) {
      InstructionText(text: "Заковахте плъзача на".uppercased())
      BigTargetNumber(text: String(roundedSlider))
      ScoreResultText(text: "Отбелязахте \(points) точки\n🎉🎉🎉")
      Button(action: {
        withAnimation {
          alertIsVisible = false
          sliderValue = 50.0
        }
        game.startNewRound(points: points)
      }) {
        DismissButtonText(text: "Следващ опит")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Constants.Colors.background)
    .cornerRadius(Constants.General.rectCornerRadius)
    .shadow(color: .gray.opacity(0.5), radius: 10, x: 5, y: 5)
    .transition(.scale)
  }
}

struct ResultView_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      ResultView(sliderValue: .constant(50.0), game: .constant(Game()), alertIsVisible: .constant(false))
    }
    VStack {
      ResultView(sliderValue: .constant(50.0), game: .constant(Game()), alertIsVisible: .constant(false))
      
    }
    .preferredColorScheme(.dark)
  }
}
