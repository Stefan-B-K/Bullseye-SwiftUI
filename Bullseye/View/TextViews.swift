
import SwiftUI

struct InstructionText: View {
    let text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
            .foregroundColor(Constants.Colors.text)
    }
}

struct BigTargetNumber: View {
    let text: String
    var body: some View {
        Text(String(text))
            .kerning(-1.0)
            .font(.largeTitle)
            .fontWeight(.black)
            .foregroundColor(Constants.Colors.text)
    }
}

struct SliderLabelsText: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .foregroundColor(Constants.Colors.text)
            .frame(width: 35.0)
    }
}

struct StatsTitleText: View {
    let text: String
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .font(.caption)
            .foregroundColor(Constants.Colors.text)
    }
}

struct StatsValueText: View {
    let text: String
    var body: some View {
        
        Text(String(text))
            .bold()
            .kerning(-0.2)
            .font(.title3)
            .frame(width: Constants.General.statusViewWidth, height: Constants.General.statusViewHeight)
            .foregroundColor(Constants.Colors.text)
        
    }
}

struct ScoreResultText: View {
    let text: String
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct DismissButtonText: View {
    let text: String
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .foregroundColor(Color.white)
            .cornerRadius(12.0)
    }
}

struct LeaderboardScoreText: View {
    let score: Int
    var body: some View {
        Text(String(score))
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .foregroundColor(Constants.Colors.text)
    }
}

struct LeaderboardDateText: View {
    let date: Date
    var body: some View {
        Text(date, style: .time)
            .kerning(-0.2)
            .bold()
            .font(.title3)
            .foregroundColor(Constants.Colors.text)
    }
}

struct LeaderboadrTitle: View {
    let text: String
    var body: some View {
        Text(String(text.uppercased()))
            .kerning(2.0)
            .font(.title)
            .fontWeight(.black)
            .foregroundColor(Constants.Colors.text)
    }
}




struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "🎯🎯🎯\nНАГЛАСЕТЕ ПЛЪЗГАЧА НАЙ-БЛИЗО ДО:")
            BigTargetNumber(text: "666")
            ScoreResultText(text: "Отбелязахте 200 точки\n🎉🎉🎉")
            DismissButtonText(text: "Следващ опит")
            LeaderboardScoreText(score: 666)
            LeaderboardDateText(date: Date())

        }
        .padding()
    }
}


