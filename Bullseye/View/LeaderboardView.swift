
import SwiftUI

struct LeaderboardView: View {
  @Binding var leaderboardIsShowing: Bool
  @Binding  var game: Game
  
  var body: some View {
    ZStack {
      Constants.Colors.background
        .edgesIgnoringSafeArea(.all)
      
      VStack(spacing: 10.0) {
        HeaderView(leaderboardIsShowing: $leaderboardIsShowing)
        LabelView()
        ScrollView {
          ForEach(game.leaderboardEntries.indices, id: \.self) {index in
            let leaderboardEntry = game.leaderboardEntries[index]
            RowView(index: index + 1, score: leaderboardEntry.score, date: leaderboardEntry.date)
          }
        }
      }
    }
  }
}


struct RowView: View {
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      CircleIndexStroked(index: index)
      Spacer()
      LeaderboardScoreText(score: score)
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      LeaderboardDateText(date: Date())
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Constants.Colors.leaderboardStroke, lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}


struct HeaderView: View {
  @Environment(\.verticalSizeClass) var verticalSize
  @Environment(\.horizontalSizeClass) var horizontalSize
  @Binding var leaderboardIsShowing: Bool
  
  var body: some View {
    ZStack {
      
      if verticalSize == .regular && horizontalSize == .compact {
        HStack {
          LeaderboadrTitle(text: "Leaderboard")
            .padding(.leading)
          Spacer()
        }
      } else {
        LeaderboadrTitle(text: "Leaderboard")
      }
      
      
      HStack {
        Spacer()
        Button(action: {
          withAnimation {
            leaderboardIsShowing = false
          }
        }) {
          CircleImageFilled(systemName: "xmark")
            .padding(.trailing)
        }
      }
      .padding()
    }
  }
}


struct LabelView: View {
  var body: some View {
    
    HStack {
      Spacer()
        .frame(width: Constants.General.circleViewDiameter)
      Spacer()
      StatsTitleText(text: "Score")
        .frame(width: Constants.Leaderboard.scoreColumnWidth)
      Spacer()
      StatsTitleText(text: "Date")
        .frame(width: Constants.Leaderboard.dateColumnWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}



struct LeaderboardView_Previews: PreviewProvider {
  static private var leaderboardIsShowing = Binding.constant(false)
  static private var game = Binding.constant(Game(loadTestData: true))
  
  static var previews: some View {
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
    
    LeaderboardView(leaderboardIsShowing: leaderboardIsShowing, game: game)
      .preferredColorScheme(.dark)
  }
}
