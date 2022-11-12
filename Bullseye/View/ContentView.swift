
import SwiftUI

struct ContentView: View {
  
  @State private var alertIsVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
    
    ZStack {
      BackgroundView(game: $game, sliderValue: $sliderValue)
      VStack {
        InstructionsView(game: $game)
          .padding(.bottom, alertIsVisible ? 0 : 100)
        if alertIsVisible {
          ResultView(sliderValue: $sliderValue,
                     game: $game,
                     alertIsVisible: $alertIsVisible)
          
        } else {
          HitMeButton(alertIsVisible: $alertIsVisible,
                      sliderValue: $sliderValue,
                      game: $game)
        }
      }
      if !alertIsVisible {
        SliderView(sliderValue: $sliderValue)
          .transition(.scale)
      }
    }
  }
}

struct InstructionsView: View {
  @Binding var game: Game
  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nНАГЛАСЕТЕ ПЛЪЗГАЧА НАЙ-БЛИЗО ДО:")
        .padding(.leading, 20.0)
        .padding(.trailing, 20.0)
      BigTargetNumber(text: String(game.target))
    }
    
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderLabelsText(text: "1")
      BullSlider(value: $sliderValue, bounds: 1.0...100.0)
      SliderLabelsText(text: "100")
    }
    .padding()
  }
}

struct HitMeButton: View {
  @Binding  var alertIsVisible: Bool
  @Binding  var sliderValue: Double
  @Binding  var game: Game
  
  var body: some View {
    Button(action: {
      withAnimation {
        alertIsVisible = true
      }
    }) {
      Text("Натисни ме".uppercased())
        .bold()
        .font(.title3)
    }
    .padding(20.0)
    .background(ZStack {
      Constants.Colors.button
      LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
    })
    .foregroundColor(Color.white)
    .cornerRadius(Constants.General.rectCornerRadius)
    .overlay(
      RoundedRectangle(cornerRadius: Constants.General.rectCornerRadius)
        .stroke(Color.white, lineWidth: Constants.General.strokeWidth)
    )
    .transition(.scale)
  }
}


struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView()
      .preferredColorScheme(.dark)
  }
}




