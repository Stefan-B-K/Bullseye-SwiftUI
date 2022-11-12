//

import SwiftUI

struct BullSlider: View {
  @Binding var value: Double
  var bounds: ClosedRange<Double>
  
  var body: some View {
    Slider(value: $value, in: bounds)
      .onAppear{
        let thumbImage = ImageRenderer(content: bullThumb).uiImage ?? UIImage(systemName: "circle.circle")
        UISlider.appearance().setThumbImage(thumbImage, for: .normal)
      }
  }
  
  var bullThumb: some View {
    VStack {
      ZStack {
        Circle()
          .frame(width: 50, height: 50)
          .foregroundColor(.white)
        Circle()
          .strokeBorder(lineWidth: 6)
          .frame(width: 44, height: 44)
        Circle()
          .strokeBorder(lineWidth: 6)
          .frame(width: 24, height: 24)
      }
      .foregroundColor(Color("AccentColor"))
    }
    .frame(width: 50, height: 50)
  }
}

struct BullSlider_Previews: PreviewProvider {
  
  static var previews: some View {
    
    BullSlider(value: .constant(40.0), bounds: 1.0...100.0)
      .preferredColorScheme(.dark)
  }
}
