
import SwiftUI

struct CircleImageStroked: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Constants.Colors.text)
            .frame(width: Constants.General.circleViewDiameter, height: Constants.General.circleViewDiameter)
            .overlay(
                Circle()
                    .strokeBorder(Constants.Colors.roundButtonStroke, lineWidth: Constants.General.strokeWidth)
            )
    }
}

struct CircleImageFilled: View {
    let systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Constants.Colors.roundButtonFilledFore)
            .frame(width: Constants.General.circleViewDiameter, height: Constants.General.circleViewDiameter)
            .background(
                Circle()
                    .fill(Constants.Colors.roundButtonFilledBack)
            )
    }
}

struct CircleIndexStroked: View {
    let index: Int
    var body: some View {
        Text("\(index)")
            .font(.title)
            .foregroundColor(Constants.Colors.text)
            .frame(width: Constants.General.circleViewDiameter, height: Constants.General.circleViewDiameter)
            .overlay(
                Circle()
                    .strokeBorder(Constants.Colors.leaderboardStroke, lineWidth: Constants.General.strokeWidth)
            )
    }
}



struct CircleImages_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 20.0) {
          CircleImageStroked(systemName: "arrow.counterclockwise")
          CircleImageStroked(systemName: "list.dash")
          CircleImageFilled(systemName: "arrow.counterclockwise")
          CircleImageFilled(systemName: "list.dash")
          CircleIndexStroked(index: 1)
        }
        VStack {
            CircleImageStroked(systemName: "arrow.counterclockwise")
            CircleImageStroked(systemName: "list.dash")
            CircleImageFilled(systemName: "arrow.counterclockwise")
            CircleImageFilled(systemName: "list.dash")
            CircleIndexStroked(index: 1)
        }
        .preferredColorScheme(.dark)
        
    }
}
